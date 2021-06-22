/*
* Copyright (c) 2019-2021 The Photostat Project (https://alecaddd.com)
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
* Authored by: Abdallah "Abdallah-Moh" Mohammad <castellani.ale@gmail.com>
*/

public class Photostat.Services.Settings : GLib.Settings {
    // Main Window Settings
    public int pos_x {
        get { return get_int ("pos-x"); }
        set { set_int ("pos-x", value); }
    }
    public int pos_y {
        get { return get_int ("pos-y"); }
        set { set_int ("pos-y", value); }
    }
    public int window_width {
        get { return get_int ("width"); }
        set { set_int ("width", value); }
    }
    public int window_height {
        get { return get_int ("height"); }
        set { set_int ("height", value); }
    }
    public bool is_maximized {
      get { return get_boolean ("maximized"); }
      set { set_boolean ("maximized", value); }
    }

    // Theme Settings
    public bool use_symbolic {
        get { return get_boolean ("use-symbolic"); }
        set { set_boolean ("use-symbolic", value); }
    }
    public bool show_label {
        get { return get_boolean ("show-label"); }
        set { set_boolean ("show-label", value); }
    }

    public Settings (string app_id) {
        Object (schema_id: app_id);
    }
}
