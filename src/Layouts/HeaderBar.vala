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

public class Photostat.Layouts.HeaderBar : Gtk.HeaderBar {
    public weak Photostat.Window window { get; construct; }

    public Widgets.HeaderBarButton preferences;
    public Widgets.MenuButton menu;

    public bool toggled {
        get {
            return visible;
        } set {
            visible = value;
            no_show_all = !value;
        }
    }

    public HeaderBar (Photostat.Window window) {
        Object (
            toggled: true,
            window: window
        );
    }

    construct {
        show_close_button = true;
        title = ("Untitled");

        menu = new Widgets.MenuButton ("document-open", ("Menu"), null);
        var menu_popover = build_main_menu_popover ();
        menu.button.popover = menu_popover;

        preferences = new Widgets.HeaderBarButton (window, "open-menu",
            ("Preferences"), {"<Ctrl>comma"}) {
                sensitive = true
            };
        preferences.button.action_name = Photostat.Services.ActionManager.ACTION_PREFIX
            + Photostat.Services.ActionManager.ACTION_PREFERENCES;

        pack_start (menu);
        pack_end (preferences);
    }

    private Gtk.PopoverMenu build_main_menu_popover () {
        var grid = new Gtk.Grid () {
            margin_top = 6,
            margin_bottom = 3,
            orientation = Gtk.Orientation.VERTICAL,
            width_request = 240,
            name = "main"
        };

        var new_window_button = create_model_button (
            ("New Window"),
            "window-new-symbolic",
            Photostat.Services.ActionManager.ACTION_PREFIX
            + Photostat.Services.ActionManager.ACTION_NEW_WINDOW);

        grid.add (new_window_button);
        grid.show_all ();

        var popover = new Gtk.PopoverMenu ();
        popover.add (grid);
        popover.child_set_property (grid, "submenu", "main");

        return popover;
    }

    private Gtk.ModelButton create_model_button (string text, string? icon, string? accels = null) {
        var button = new Gtk.ModelButton ();
        button.get_child ().destroy ();
        var label = new Granite.AccelLabel.from_action_name (text, accels);

        if (icon != null) {
            var image = new Gtk.Image.from_icon_name (icon, Gtk.IconSize.MENU);
            image.margin_end = 6;
            label.attach_next_to (
                image,
                label.get_child_at (0, 0),
                Gtk.PositionType.LEFT
            );
        }

        button.add (label);
        button.action_name = accels;

        return button;
    }
}
