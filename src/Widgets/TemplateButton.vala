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

public class Photostat.Widgets.TemplateButton : Gtk.FlowBoxChild {
    public TemplateButton (string icon_name) {
        var icon = new Gtk.Image () {
            gicon = new ThemedIcon ("2k-1.66_1"),
            pixel_size = 128
        };

        var button_box = new Gtk.Grid () {
            margin = 9
        };
        button_box.add (icon);

        var check = new Gtk.Image.from_icon_name ("selection-checked", Gtk.IconSize.LARGE_TOOLBAR) {
            halign = Gtk.Align.START,
            valign = Gtk.Align.START
        };

        var check_revealer = new Gtk.Revealer () {
            transition_type = Gtk.RevealerTransitionType.CROSSFADE
        };
        check_revealer.add (check);

        var overlay = new Gtk.Overlay ();
        overlay.add (button_box);
        overlay.add (check_revealer);

        var event_box = new Gtk.EventBox ();
        event_box.add (overlay);

        halign = Gtk.Align.CENTER;
        valign = Gtk.Align.CENTER;
        margin = 6;
        add (event_box);
    }
}
