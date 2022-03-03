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
 */

public class Photostat.Widgets.TemplateRow : Gtk.ListBoxRow {
    private Gtk.Label row_label;
    private Gtk.Image row_icon;

    public TemplateRow (string name, string icon_name) {

        row_label = new Gtk.Label (name) {
            margin_start = 5,
            halign = Gtk.Align.START,
            hexpand = true,
            ellipsize = Pango.EllipsizeMode.END
        };
        row_icon = new Gtk.Image.from_icon_name (icon_name, Gtk.IconSize.MENU) {
            margin_start = 5
        };

        var grid = new Gtk.Grid ();
        grid.attach (row_icon, 0, 0);
        grid.attach (row_label, 1, 0);

        add (grid);
    }
}
