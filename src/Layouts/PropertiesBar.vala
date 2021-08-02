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
 * Authored by: Abdallah "Abdallah-Moh" Mohammad <abdallah.mam29@gmail.com>
*/

public class Photostat.Layouts.PropertiesBar : Gtk.Grid {
    public weak Photostat.Window window { get; construct; }


    public PropertiesBar (Photostat.Window window) {
        Object (
            window: window,
            orientation: Gtk.Orientation.HORIZONTAL
        );
    }

    construct {
        var title = new Gtk.Grid ();
        var title_label = new Gtk.Label ("Properties");
        title_label.hexpand = true;
        title.attach (title_label, 0, 0, 1, 1);
        attach (title, 0, 0, 1, 1);
        show_all ();
    }
}
