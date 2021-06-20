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

public class Photostat.Window : Gtk.ApplicationWindow {
    public Photostat.Layouts.HeaderBar headerbar;

    public Window (Photostat.Application photostat_app) {
        Object (
            application: photostat_app,
            icon_name: "com.github.photostat-editor-akira"
        );
    }

    construct {
        get_style_context ().add_class ("rounded");

        // var headerbar = new Gtk.HeaderBar ();
        // headerbar.get_style_context ().add_class ("flat");
        // headerbar.show_close_button = true;
        // headerbar.custom_title = new Gtk.Label ("Photostat");
        // set_titlebar (headerbar);

        headerbar = new Photostat.Layouts.HeaderBar (this);

        build_ui ();

        resize (settings.window_width, settings.window_height);
        move (settings.pos_x, settings.pos_y);
        if (settings.is_maximized) {
            maximize ();
        }

        delete_event.connect ((event) => {
            before_destroy ();
            // TODO: Check if image is saved
            return false;
        });
    }

    private void build_ui () {
        set_titlebar (headerbar);
    }

    public void before_destroy () {
        int x, y, width, height;

        get_position (out x, out y);
        get_size (out width, out height);

        settings.pos_x = x;
        settings.pos_y = y;
        settings.window_width = width;
        settings.window_height = height;
        settings.is_maximized = is_maximized;
    }
}
