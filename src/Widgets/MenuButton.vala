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

public class Photostat.Widgets.MenuButton : Gtk.Grid {
    public Gtk.MenuButton button;
    public Gtk.Label label_btn;
    public ButtonImage image;

    public MenuButton (string icon_name, string name, string[]? accels = null) {
        label_btn = new Gtk.Label (name);
        // label_btn.get_style_context ().add_class ("header-label") // CSS has not been set yet

        button = new Gtk.MenuButton () {
            can_focus = false,
            halign = Gtk.Align.CENTER,
            tooltip_markup = Granite.markup_accel_tooltip (accels, name)
        };

        image = new ButtonImage (icon_name);
        button.add (image);

        attach (button, 0, 0, 1, 1);
        attach (label_btn, 0, 1, 1, 1);

        valign = Gtk.Align.CENTER;
    }
}
