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

 public class Photostat.Dialogs.TemplateChooser : Hdy.Window {
     public weak Photostat.Window window { get; construct; }

     private Widgets.TemplateRow recent_row;
     private Widgets.TemplateRow default_row;
     private Widgets.TemplateRow paper_row;
     private Widgets.TemplateRow photo_row;
     private Widgets.TemplateRow web_row;
     private Widgets.TemplateRow social_row;
     private Widgets.TemplateRow film_video_row;
     private Widgets.TemplateRow iconography_row;
     private Widgets.TemplateRow devices_row;

     public TemplateChooser (Photostat.Window _window) {
         Object (
             window: _window,
             resizable: false,
             deletable: true,
             width_request: 1000,
             height_request: 700
         );
     }

     static construct {
         Hdy.init ();
     }

     construct {
         // var sidebar_header = new Hdy.HeaderBar () {
         //     has_subtitle = false,
         //     show_close_button = false
         // };
         // sidebar_header.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
         // sidebar_header.get_style_context ().add_class ("default-decoration");

        // var individualview_header = new Hdy.HeaderBar () {
        //     has_subtitle = false,
        //     show_close_button = false
        // };
        // individualview_header.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        // individualview_header.get_style_context ().add_class ("default-decoration");

        var search_entry = new Gtk.SearchEntry () {
            margin_start = 9,
            margin_end = 9,
            margin_top = 16,
            margin_bottom = 6,
            hexpand = true,
            placeholder_text = ("Search Templates"),
            valign = Gtk.Align.CENTER
        };

        var listbox = new Gtk.ListBox () {
            activate_on_single_click = true,
            expand = true,
            selection_mode = Gtk.SelectionMode.SINGLE
        };

        recent_row = new Widgets.TemplateRow ("Recent", "document-open-recent");
        default_row = new Widgets.TemplateRow ("Default", "text-x-preview");
        paper_row = new Widgets.TemplateRow ("Paper", "folder-documents");
        photo_row = new Widgets.TemplateRow ("Photo", "image-x-generic");
        web_row = new Widgets.TemplateRow ("Web", "applications-internet");
        social_row = new Widgets.TemplateRow ("Social", "system-users");
        film_video_row = new Widgets.TemplateRow ("Film and Video", "video-x-generic");
        iconography_row = new Widgets.TemplateRow ("Icons", "x-office-drawing");
        devices_row = new Widgets.TemplateRow ("Devices", "computer");

        listbox.add (recent_row);
        listbox.add (default_row);
        listbox.add (paper_row);
        listbox.add (photo_row);
        listbox.add (web_row);
        listbox.add (social_row);
        listbox.add (film_video_row);
        listbox.add (iconography_row);
        listbox.add (devices_row);

        var scrolled_window = new Gtk.ScrolledWindow (null, null);
        scrolled_window.add (listbox);

        var sidebar_grid = new Gtk.Grid ();
        sidebar_grid.get_style_context ().add_class (Gtk.STYLE_CLASS_SIDEBAR);
        // sidebar_grid.attach (sidebar_header, 0, 0);
        sidebar_grid.attach (search_entry, 0, 0);
        sidebar_grid.attach (scrolled_window, 0, 1);

        var placeholder = new Gtk.Label ("No Artboards Selected") {
            expand = true
        };
        placeholder.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        placeholder.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);

        var label = new Gtk.Label ("Choose a Template");
        label.set_markup ("<span font_desc='Inter 15'><b>Choose a Template</b></span>");
        label.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);

        var template_grid = new Gtk.Grid ();
        template_grid.add (label);

        var create_btn = new Gtk.Button.with_label ("Create");
        create_btn.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        var cancel_btn = new Gtk.Button.with_label ("Cancel") {
            margin_end = 6
        };

        cancel_btn.clicked.connect (() => {
            destroy ();
        });

        var button_grid = new Gtk.Grid () {
            halign = Gtk.Align.END
        };
        button_grid.attach (cancel_btn, 1, 0);
        button_grid.attach (create_btn, 2, 0);

        var individual_view = new Gtk.Grid ();
        individual_view.attach (template_grid, 0, 0);
        individual_view.attach (placeholder, 0, 1);

        var individual_grid = new Gtk.Grid () {
            margin = 16
        };
        // individual_grid.attach (individualview_header, 0, 0);
        individual_grid.attach (individual_view, 0, 0);
        individual_grid.attach (button_grid, 0, 1);

        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.pack1 (sidebar_grid, false, false);
        paned.pack2 (individual_grid, true, false);

        add (paned);
     }
 }
