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

public class Photostat.Services.ActionManager : Object {
    public weak Photostat.Application app { get; construct; }
    public weak Photostat.Window window { get; construct; }

    public SimpleActionGroup actions { get; construct; }

    public const string ACTION_PREFIX = "win.";
    public const string ACTION_PREFERENCES = "action_preferences";

    public static Gee.MultiMap<string, string> action_accelerators = new Gee.HashMultiMap<string, string> ();

    private const ActionEntry[] ACTION_ENTRIES = {
        { ACTION_PREFERENCES, action_preferences },
    };

    public ActionManager (Photostat.Application photostat_app, Photostat.Window window) {
        Object (
            app: photostat_app,
            window: window
        );
    }

    static construct {
        action_accelerators.set (ACTION_PREFERENCES, "<Control>comma");
    }

    construct {
        actions = new SimpleActionGroup ();
        actions.add_action_entries (ACTION_ENTRIES, this);
        window.insert_action_group ("win", actions);

        var iter = action_accelerators.map_iterator ();
        while (iter.next ()) {
            app.set_accels_for_action (ACTION_PREFIX + iter.get_key (), {iter.get_value () });
        }
    }

    private void action_preferences () {
        var settings_dialog = new Photostat.Dialogs.SettingsDialog (window);
        settings_dialog.show_all ();
    }
}
