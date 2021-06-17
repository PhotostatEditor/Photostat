public class Photostat.Application : Gtk.Application {

    construct {
        application_id = "com.github.photostat-editor.photostat";
        flags = ApplicationFlags.FLAGS_NONE;
    }

    public override void open (File[] files, string hint) {
        init_theme ();

        Photostat.Window opened_window = null;

        get_windows ().foreach ((win) => {
            if (win is Photostat.Window) {
                opened_window = win as Photostat.Window;
            }
            else {
                win.destroy ();
            }
        });
        // Loop through all selected files.
        foreach (var file in files) {
            string image_path = file.get_path ();
            if (opened_window != null) {
                // Add Image to a new tab
                continue;
            }
            opened_window = new Photostat.Window (this);
            // Load Image to window
        }
    }

    public override void activate () {
        init_theme ();

        var window = new Photostat.SetupWindow (this);
        window.show_all ();
        this.add_window (window);

        var quit_action = new SimpleAction ("quit", null);

        this.add_action (quit_action);
        set_accels_for_action ("app.quit", {"<Control>q"});

        quit_action.activate.connect (() => {
            if (window != null) {
                window.destroy ();
                return;
            }
            get_windows ().foreach ((win) => {
                ((Photostat.Window)win).before_destroy ();
                win.destroy ();
            });
        });
    }

    private void init_theme () {
        // Return if a window is opened which means theme is already loaded
        if (this.get_windows ().length () > 0) {
            return;
        }

        Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = true;
        Gtk.Settings.get_default ().set_property ("gtk-icon-theme-name", "elementary");
        Gtk.Settings.get_default ().set_property ("gtk-theme-name", "io.elementary.stylesheet.blueberry");
    }
}

public static int main (string[] args) {
    var application = new Photostat.Application ();
    return application.run (args);
}
