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

public class Photostat.Widgets.ButtonImage : Gtk.Image {
    private string icon;
    private Gtk.IconSize size;

    public ButtonImage (string icon_name, Gtk.IconSize icon_size = Gtk.IconSize.LARGE_TOOLBAR) {
        icon = icon_name;
        size = icon_size;
        margin = 0;

    /* Work on the settings has not been started yet */

    //     settings.changed["use-symbolic"].connect (update_image);
    //     update_image ();
    // }

    // ~ButtonImage () {
    //     settings.changed["use-symbolic"].disconnect (update_image);
    // }

    // private void update_image () {
    //     if (settings.use_symbolic) {
    //         set_from_icon_name ("%s-symbolic".printf (icon), Gtk.IconSize.SMALL_TOOLBAR);
    //         return;
    //     }

    //     set_from_icon_name (icon.replace ("-symbolic", ""), size);
    }
}
