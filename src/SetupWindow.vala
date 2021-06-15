public class Photostat.SetupWindow : Gtk.Window {
    
    public SetupWindow (Photostat.Application photostat_app) {
        Object (
            deletable: false,
            height_request: 700,
            resizable: false,
            width_request: 950,
            window_position: Gtk.WindowPosition.CENTER_ALWAYS
        );
    }
    
    construct {
        this.get_style_context ().add_class ("rounded");
        
        var headerbar = new Gtk.HeaderBar ();
        headerbar.get_style_context ().add_class ("flat");
        headerbar.get_style_context ().add_class ("default-decoration");
        
        this.set_titlebar (headerbar);
        
        var grid = new Gtk.Grid () {
            margin = 24
        };
        
        var setup = new Granite.Widgets.Welcome ("Photostat", "This is a demo");
        setup.append ("document-new", "Create a new empty document", "Sub text");
        setup.append ("system-file-manager", "Browse Images on you computer", "Sub text 2");
        
        grid.attach (setup, 0, 1, 1, 1);
        
        this.add (grid);
    }
}
