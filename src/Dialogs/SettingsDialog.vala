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

public class Photostat.Dialogs.SettingsDialog : Granite.Dialog {
    public weak Photostat.Window window { get; construct; }
    private Gtk.Stack stack;
    private Gtk.Switch label_switch;
    private Gtk.Switch symbolic_switch;

    public SettingsDialog (Photostat.Window _window) {
        Object (
            window: _window,
            border_width: 6,
            deletable: true,
            resizable: false,
            modal: true,
            title: ("Preferences")
        );
    }

    construct {
        transient_for = window;
        stack = new Gtk.Stack ();
        stack.margin = 6;
        stack.margin_bottom = 15;
        stack.margin_top = 15;
        stack.add_titled (get_general_box (), "general", ("General"));
        stack.add_titled (get_interface_box (), "interface", ("Interface"));

        var stack_switcher = new Gtk.StackSwitcher ();
        stack_switcher.set_stack (stack);
        stack_switcher.halign = Gtk.Align.CENTER;

        var grid = new Gtk.Grid ();
        grid.halign = Gtk.Align.CENTER;
        grid.attach (stack_switcher, 1, 1, 1, 1);
        grid.attach (stack, 1, 2, 1, 1);

        get_content_area ().add (grid);

        var close_button = (Gtk.Button) add_button (("Close"), Gtk.ResponseType.CLOSE);
        close_button.clicked.connect (() => {
            destroy ();
        });
    }

    private Gtk.Widget get_general_box () {
        var grid = new Gtk.Grid ();
        grid.row_spacing = 6;
        grid.column_spacing = 12;
        grid.column_homogeneous = true;

        grid.attach (new SettingsHeader (("General")), 0, 0, 2, 1);

        return grid;
    }

    private Gtk.Widget get_interface_box () {
        var grid = new Gtk.Grid ();
        grid.row_spacing = 6;
        grid.column_spacing = 12;
        grid.column_homogeneous = true;

        grid.attach (new SettingsLabel (("Show Button Labels:")), 0, 5, 1, 1);
        label_switch = new SettingsSwitch ("show-label");
        grid.attach (label_switch, 1, 5, 1, 1);

        grid.attach (new SettingsLabel (("Use Symbolic Icons:")), 0, 6, 1, 1);
        symbolic_switch = new SettingsSwitch ("use-symbolic");
        grid.attach (symbolic_switch, 1, 6, 1, 1);

        return grid;
    }

    private class SettingsHeader : Gtk.Label {
        public SettingsHeader (string text) {
            label = text;
            get_style_context ().add_class ("h4");
            halign = Gtk.Align.START;
        }
    }

    private class SettingsSwitch : Gtk.Switch {
        public SettingsSwitch (string setting) {
            halign = Gtk.Align.START;
            settings.bind (setting, this, "active", SettingsBindFlags.DEFAULT);
        }
    }

    private class SettingsLabel : Gtk.Label {
        public SettingsLabel (string text) {
            label = text;
            halign = Gtk.Align.END;
        }
    }
}
