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
    public GLib.List<Window> windows;

    construct {
        application_id = "com.github.photostat_editor.photostat";

        flags = ApplicationFlags.FLAGS_NONE;

        settings = new Photostat.Services.Settings ("com.github.photostat_editor.photostat");
        windows = new GLib.List<Window> ();
    }

    public void new_window () {
        new Photostat.Window (this).present ();
    }

    public override void activate () {
        init_theme ();

        var window = new Photostat.Window (this);
        add_window (window);

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

        if (window.length () > 0) {
            return;
        }

        Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = true;
        Gtk.Settings.get_default ().set_property ("gtk-icon-theme-name", "elementary");
        GLib.Value value = GLib.Value (GLib.Type.STRING);
        Gtk.Settings.get_default ().get_property ("gtk-theme-name", ref value);
        if (!value.get_string ().has_prefix ("io.elementary.stylesheet")) {
            Gtk.Settings.get_default ().set_property ("gtk-theme-name", "io.elementary.stylesheet.blueberry");
        }
    }
}

public static int main (string[] args) {
    var application = new Photostat.Application ();
    return application.run (args);
}
