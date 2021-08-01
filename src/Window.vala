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

public class Photostat.Window : Hdy.ApplicationWindow {
    public weak Photostat.Application app { get; construct; }
    public Photostat.Services.EventBus event_bus;

    public Photostat.Services.ActionManager action_manager;
    public Photostat.Layouts.HeaderBar headerbar;
    public Photostat.Layouts.MainWindow main_window;

    public Window (Photostat.Application photostat_app) {
        Object (
            application: photostat_app,
            app: photostat_app,
            icon_name: "com.github.photostat_editor-photostat"
        );
    }

    static construct {
        Hdy.init ();
    }

    construct {
        var provider = new Gtk.CssProvider ();
        provider.load_from_resource ("/com/github/photostat_editor/photostat/styles.css");
        Gtk.StyleContext.add_provider_for_screen (
            Gdk.Screen.get_default (),
            provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        );

        event_bus = new Photostat.Services.EventBus ();
        action_manager = new Photostat.Services.ActionManager (app, this);
        headerbar = new Photostat.Layouts.HeaderBar (this);
        main_window = new Photostat.Layouts.MainWindow (this);

        build_ui ();

        resize (settings.window_width, settings.window_height);

        move (settings.pos_x, settings.pos_y);

        if (settings.is_maximized) {
            maximize ();
        }


        show_app ();
    }

    private void build_ui () {
        set_border_width (0);

        var container_grid = new Gtk.Grid ();
        container_grid.attach (headerbar, 0, 0);
        container_grid.attach (main_window, 0, 1);

        add (container_grid);

        delete_event.connect ((event) => {
            before_destroy ();
            // TODO: Check if image is saved
            return false;
        });
    }

    public void before_destroy () {
        int x, y, width, height;

        get_position (out x, out y);
        get_size (out width, out height);

        settings.pos_x = x;
        settings.pos_y = y;
        settings.window_width = width;
        settings.window_height = height;
        settings.is_maximized = is_maximized;
    }

    public void show_app () {
        show_all ();
        show ();
    }
}
