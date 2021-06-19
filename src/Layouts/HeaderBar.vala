/*
* Copyright (c) 2021 The Photostat Project
*
* This file is part of Photostat.
*
* Photostat is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* Photostat is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
* You should have received a copy of the GNU General Public License
* along with Photostat. If not, see <https://www.gnu.org/licenses/>.
*
* Authored by: Abdallah "Abdallah-Moh" Mohammad <abdullah_mam1@icloud.com>
* Authored by: Rajdeep "Suzie97" Singha <singharajdeep97@gmail.com>
*/

public class Photostat.Layouts.HeaderBar : Gtk.HeaderBar {
    public weak Photostat.Window window { get; construct; }

    public Widgets.HeaderBarButton preferences;

    public bool toggled {
        get {
            return visible;
        } set {
            visible = value;
            no_show_all = !value;
        }
    }

    construct {
        show_close_button = true;
        title = ("Untitled");

        preferences = new Widgets.HeaderBarButton (window, "open-menu",
            ("Settings"), {"<Ctrl>comma"}) {
                sensitive = true
            };
        // preferences.button.action_name = Photostat.Services.ActionManager.ACTION_PREFIX
        //     + Photostat.Services.ActionManager.ACTION_PREFERENCES; // TODO work on the services later

        pack_end (preferences);
    }
}
