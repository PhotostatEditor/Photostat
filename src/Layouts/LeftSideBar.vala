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

public class Photostat.Layouts.LeftSideBar : Gtk.Grid {
    public weak Photostat.Window window { get; construct; }

    public LeftSideBar (Photostat.Window window) {
        Object (
            window: window,
            orientation: Gtk.Orientation.HORIZONTAL
        );
    }

    construct {
        get_style_context ().add_class ("sidebar");
        // TODO: Add a tab that contains history and layers
        attach (new Gtk.Label ("This is the left sidebar"), 0, 0, 1, 1);
        show_all ();
    }
}