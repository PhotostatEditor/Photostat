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
 * Authored by: Rajdeep "Suzie97" Singha <singharajdeep97@gmail.com>
 *              Abdallah "Abdallah-Moh" Mohammad <abdullah_mam1@icloud.com>
 */

public class Photostat.Layouts.MainWindow : Gtk.Grid {
    public weak Photostat.Window window { get; construct; }

    public MainWindow (Photostat.Window window) {
        Object (window: window);
    }

    construct {
        // Add sidebars and main canvas here
    }
}
