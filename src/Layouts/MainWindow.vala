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

    public Layouts.MainCanvas main_canvas;
    public Layouts.RightSideBar right_sidebar;
    public Layouts.PropertiesBar properties_bar;
    public Layouts.ToolsBar tools_bar;

    public Gtk.Paned main_pane;
    public Gtk.Paned child_pane;

    public Gtk.Grid left_sidebar;


    public MainWindow (Photostat.Window window) {
        Object (window: window);
    }

    construct {
<<<<<<< HEAD
        // Add sidebars and main canvas here
        var welcome_view = new Photostat.Widgets.WelcomeView (window);

        add (welcome_view);
=======
        right_sidebar = new Layouts.RightSideBar (window);
        properties_bar = new Layouts.PropertiesBar (window);
        main_canvas = new Layouts.MainCanvas (window);
        tools_bar = new Photostat.Layouts.ToolsBar (window);

        main_pane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        child_pane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);

        left_sidebar = new Gtk.Grid ();
        left_sidebar.get_style_context ().add_class ("sidebar");
        left_sidebar.vexpand = true;
        left_sidebar.hexpand = true;
        left_sidebar.attach (tools_bar, 0, 0, 1, 1);
        left_sidebar.attach (properties_bar, 1, 0, 1, 1);

        main_pane.vexpand = true;
        main_pane.hexpand = true;

        main_pane.pack2 (child_pane, true, false);
        child_pane.pack1 (main_canvas, true, false);

        main_pane.pack1 (left_sidebar, false, false);
        child_pane.pack2 (right_sidebar, false, false);

        attach (main_pane, 0, 0, 1, 1);
>>>>>>> master
    }
}
