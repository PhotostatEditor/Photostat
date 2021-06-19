/*
* Copyright (c) 2021 The Photostat Project
*
* This file is part of Photostat.
*
* Photostat is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* Photostat is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
* You should have received a copy of the GNU General Public License
* along with Photostat. If not, see <https://www.gnu.org/licenses/>.
*
* Authored by: Abdallah "Abdallah-Moh" Mohammad <abdullah_mam1@icloud.com>
* Authored by: Singha "Suzie97" Rajdeep <singharajdeep97@gmail.com>
*/

public class Photostat.Window : Gtk.ApplicationWindow {

    public GLib.Settings settings { get; private set; }

    public Window (Photostat.Application photostat_app) {
        Object (
            application: photostat_app,
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        get_style_context ().add_class ("rounded");
        var headerbar = new Gtk.HeaderBar () {
            show_close_button = true,
            custom_title = new Gtk.Label ("Untitled - Photostat")
        };
        // headerbar.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        var preferences_button = new Gtk.Button.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);

        headerbar.pack_end (preferences_button);

        set_titlebar (headerbar);

        settings = new GLib.Settings ("com.github.photostat-editor.photostat");

        resize (settings.get_int ("width"), settings.get_int ("height"));

        if (settings.get_int ("pos-x") != 0 && settings.get_int ("pos-y") != 0) {
            move (settings.get_int ("pos-x"), settings.get_int ("pos-y"));
        }

        if (settings.get_boolean ("maximized")) {
            maximize ();
        }

        delete_event.connect ((event) => {
            return before_destroy ();
        });
    }

    public bool before_destroy () {
        int x, y, width, height;
        get_size (out x, out y);
        get_position (out width, out height);
        settings.set_int ("pos-x", x);
        settings.set_int ("pos-y", y);
        settings.set_int ("width", width);
        settings.set_int ("height", height);
        settings.set_boolean ("maximized", is_maximized);
        return false;
    }
}
