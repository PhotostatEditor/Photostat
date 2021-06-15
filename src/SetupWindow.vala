public class Photostat.SetupWindow : Gtk.Window {

    public SetupWindow (Photostat.Application photostat_app) {
        Object (
            deletable: false,
            height_request: 700,
            resizable: false,
            width_request: 950,
            window_position: Gtk.WindowPosition.CENTER_ALWAYS
        );

        // Handle dragging the entire widget
        button_press_event.connect ((e) => {
            if (e.button == Gdk.BUTTON_PRIMARY) {
                begin_move_drag ((int) e.button, (int) e.x_root, (int) e.y_root, e.time);
                return true;
            }
            return false;
        });
    }

    construct {
        get_style_context ().add_class ("rounded");

        var headerbar = new Gtk.HeaderBar ();
        headerbar.get_style_context ().add_class ("flat");
        headerbar.get_style_context ().add_class ("default-decoration");

        set_titlebar (headerbar);

        var app_icon = new Gtk.Image () {
            gicon = new ThemedIcon ("application-default-icon"),
            pixel_size = 128
        };

        var new_document_icon = new Gtk.Image () {
            gicon = new ThemedIcon ("document-new")
        };

        var file_manager_icon = new Gtk.Image () {
            gicon = new ThemedIcon ("system-file-manager")
        };

        var title_label = new Gtk.Label ("Photostat") {
            justify = Gtk.Justification.CENTER,
            hexpand = true
        };
        title_label.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);

        var subtitle_label = new Gtk.Label ("The Linux Photo Editing Tool") {
            justify = Gtk.Justification.CENTER,
            hexpand = true
        };
        subtitle_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);

        var options = new Gtk.Grid () {
            expand = true,
            margin = 12,
            orientation = Gtk.Orientation.VERTICAL,
            halign = Gtk.Align.CENTER,
            margin_top = 24
        };

        var empty_project_button = new Granite.Widgets.WelcomeButton (new_document_icon,
            "Create a new empty document", "Creates a new empty image with the choosed size");

        var file_dialog_button = new Granite.Widgets.WelcomeButton (file_manager_icon,
            "Browse images on your computer", "Open an image file from your system");

        options.add (empty_project_button);
        options.add (file_dialog_button);

        var content = new Gtk.Grid () {
            expand = true,
            margin = 12,
            orientation = Gtk.Orientation.VERTICAL,
            valign = Gtk.Align.CENTER
        };

        content.add (app_icon);
        content.add (title_label);
        content.add (subtitle_label);
        content.add (options);
        
        add (content);
    }
}
