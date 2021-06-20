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

public class Photostat.Widgets.HeaderBarButton : Gtk.Grid {
    public weak Photostat.Window window;

    public Gtk.Button button;
    private Gtk.Label label_btn;
    private ButtonImage image;
    public string? sensitive_type;

    public HeaderBarButton (Photostat.Window _window, string icon_name, string name,
        string[]? accels = null, string? type = null) {
        window = _window;
        sensitive_type = type;
        label_btn = new Gtk.Label (name);
        // label_btn.get_style_context ().add_class ("headerbar-label"); // CSS is not yet set, for use later

        button = new Gtk.Button () {
            can_focus = false,
            halign = Gtk.Align.CENTER,
            tooltip_markup = Granite.markup_accel_tooltip (accels, name)
        };
        button.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);

        image = new ButtonImage (icon_name);
        button.add (image);

        attach (button, 0, 0, 1, 1);
        attach (label_btn, 0, 1, 1, 1);

        valign = Gtk.Align.CENTER;
        sensitive = false;

    /* Work on the settings has not been started yet */
        // update_label ();
        // build_signals ();

    //     settings.changed["show-label"].connect (() => {
    //         update_label ();
    //     });
    // }

    // private void update_label () {
    //     label_btn.visible = settings.show_label;
    //     label_btn.no_show_all = !settings.show_label;
    // }

    // private void build_signals () {
    //     window.event_bus.change_sensitivity.connect (() => {
    //         if (type == sensitive_type) {
    //             sensitive = !sensitive;
    //         }
    //     });
    }
}
