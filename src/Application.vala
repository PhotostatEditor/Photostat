/*
 * Copyright (c) 2021 The Photostat Project
 *
 * This file is part of Photostat.
 *
 * Photostat is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Photostat is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Photostat. If not, see <https://www.gnu.org/licenses/>.
 *
 * Authored by: Abdallah "Abdallah-Moh" Mohammad <abdullah_mam1@icloud.com>
 *              Rajdeep "Suzie97" Singha <singharajdeep97@gmail.com>
 */

namespace Photostat {
    public Photostat.Services.Settings settings;
}

public class Photostat.Application : Gtk.Application {
    public GLib.List<Window> window;

    private static bool create_new_window = false;

    const OptionEntry[] ENTRIES = {
        { "new-window", 'n', 0, OptionArg.NONE, null, ("New Window"), null },
        { null }
    };

    construct {
        flags |= ApplicationFlags.HANDLES_COMMAND_LINE;

        application_id = "com.github.photostat_editor.photostat";

        add_main_option_entries (ENTRIES);

        settings = new Photostat.Services.Settings ("com.github.photostat_editor.photostat");
        window = new GLib.List<Window> ();
    }

    public override int command_line (GLib.ApplicationCommandLine command_line) {
        var options = command_line.get_options_dict ();

        if (options.contains ("new-window")) {
            create_new_window = true;
        }

        activate ();

        return Posix.EXIT_SUCCESS;
    }

    public override void activate () {
        init_theme ();

        var window = get_last_window ();

        if (window != null && create_new_window) {
            create_new_window = false;
            new_window ();
        } else if (window == null) {
            window = new_window ();
            window.show ();
        } else {
            window.present ();
        }

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        set_accels_for_action ("app.quit", {"<Control>q"});

        quit_action.activate.connect (() => {
            get_windows ().foreach ((win) => {
                ((Photostat.Window)win).before_destroy ();
                win.destroy ();
            });
        });
    }

    private void init_theme () {

        if (windows.length () > 0) {
            return;
        }

        var gtk_settings = Gtk.Settings.get_default ();
        gtk_settings.gtk_application_prefer_dark_theme = true;
        gtk_settings.set_property ("gtk-icon-theme-name", "elementary");
        
        weak Gtk.IconTheme default_theme = Gtk.IconTheme.get_default ();
        default_theme.add_resource_path ("/com/github/photostat_editor/photostat");
        GLib.Value value = GLib.Value (GLib.Type.STRING);
        gtk_settings.get_property ("gtk-theme-name", ref value);
        if (!value.get_string ().has_prefix ("io.elementary.stylesheet")) {
            gtk_settings.set_property ("gtk-theme-name", "io.elementary.stylesheet.blueberry");
        }

        var provider = new Gtk.CssProvider ();
        provider.load_from_resource ("/com/github/photostat_editor/photostat/styles.css");
        Gtk.StyleContext.add_provider_for_screen (
            Gdk.Screen.get_default (),
            provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        );
    }

    public Photostat.Window? get_last_window () {
        unowned List<Gtk.Window> windows = get_windows ();
        return windows.length () > 0 ? windows.last ().data as Window : null;
    }

    public Photostat.Window new_window () {
        return new Window (this);
    }
}

public static int main (string[] args) {
    var application = new Photostat.Application ();
    return application.run (args);
}
