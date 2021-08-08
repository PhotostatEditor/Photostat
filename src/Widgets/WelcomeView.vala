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

public class Photostat.Widgets.WelcomeView : Granite.Widgets.Welcome {
    public weak Photostat.Window window { get; construct; }

    public WelcomeView (Photostat.Window window) {
        Object (
            window: window,
            title: _("Import Some Photos"),
            subtitle: _("Open a photo to begin editing")
        );
    }

    construct {
        append ("document-new", _("New Document"), _("Create a new empty document"));
        append ("document-open", _("Open Image"), _("Open a saved image"));

        activated.connect ((i) => {
            if (i == 0) {
                var template_view = new Photostat.Dialogs.TemplateChooser (window);
                template_view.show_all ();
                if (window.get_children () != null) {
                    window.accept_focus = false;
                }
            }
        });
    }
}
