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

     public Gtk.Button cancel_btn;

     public TemplateChooser (Photostat.Window _window) {
         Object (
             window: _window,
             resizable: false,
             deletable: true,
             width_request: 1000,
             height_request: 700,
             window_position: Gtk.WindowPosition.CENTER_ON_PARENT,
             modal: true,
             transient_for: _window,
             type_hint: Gdk.WindowTypeHint.DIALOG
         );
     }

     static construct {
         Hdy.init ();
     }

     construct {
         var sidebar_header = new Hdy.HeaderBar () {
             has_subtitle = false,
             show_close_button = false
         };
         sidebar_header.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
         sidebar_header.get_style_context ().add_class ("default-decoration");

        var individualview_header = new Hdy.HeaderBar () {
            has_subtitle = false,
            show_close_button = false
        };
        individualview_header.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        individualview_header.get_style_context ().add_class ("default-decoration");

        var search_entry = new Gtk.SearchEntry () {
            margin_start = 9,
            margin_end = 9,
            margin_top = 16,
            margin_bottom = 6,
            hexpand = true,
            placeholder_text = ("Search Templates"),
            valign = Gtk.Align.CENTER
        };

        var categories_label = new Gtk.Label ("Categories") {
            halign = Gtk.Align.START
        };
        categories_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

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
        sidebar_grid.attach (categories_label, 0, 1);
        sidebar_grid.attach (scrolled_window, 0, 2);

        // TODO: Replace this placeholder with the artboard templates
        // var placeholder = new Gtk.Label ("No Artboards Selected") {
        //     expand = true
        // };
        // placeholder.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        // placeholder.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);

        var template_view = new Gtk.FlowBox () {
            activate_on_single_click = true,
            homogeneous = true,
            selection_mode = Gtk.SelectionMode.SINGLE
        };
        template_view.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);

        var template_scrolled_window = new Gtk.ScrolledWindow (null, null) {
            hscrollbar_policy = Gtk.PolicyType.NEVER,
            expand = true
        };
        template_view.add (template_scrolled_window);

        var choose_template_label = new Gtk.Label ("Choose a Template");
        // choose_template_label.set_markup ("<span font_desc='Inter 15'><b>Choose a Template</b></span>");
        choose_template_label.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);
        choose_template_label.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);

        var choose_template_grid = new Gtk.Grid () {
            margin_top = 24,
            margin_start = 24,
            margin_bottom = 12
        };
        choose_template_grid.add (choose_template_label);

        var show_advanced_button = new Gtk.Button.with_label ("Show Advanced");

        var create_btn = new Gtk.Button.with_label ("Create");
        create_btn.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        cancel_btn = new Gtk.Button.with_label ("Cancel");

        cancel_btn.clicked.connect (() => {
            destroy ();
        });

        destroy.connect (() => {
            _window.accept_focus = true;
        });

        var width_label = new Gtk.Label ("Width: ") {
            halign = Gtk.Align.END
        };
        var width_entry = new Gtk.SpinButton.with_range (1, 99999, 1);

        var height_label = new Gtk.Label ("Height: ") {
            halign = Gtk.Align.END
        };
        var height_entry = new Gtk.SpinButton.with_range (1, 99999, 1);

        var dpi_label = new Gtk.Label ("DPI: ") {
            halign = Gtk.Align.END,
            margin_start = 32
        };
        var dpi_combobox = new Gtk.ComboBox ();

        var unit_label = new Gtk.Label ("Units: ") {
            halign = Gtk.Align.END,
            margin_start = 32
        };
        var unit_combobox = new Gtk.ComboBox ();

        var size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
        size_group.add_widget (width_entry);
        size_group.add_widget (height_entry);
        size_group.add_widget (dpi_combobox);
        size_group.add_widget (unit_combobox);

        var options_grid = new Gtk.Grid () {
            column_spacing = 12,
            row_spacing = 12,
            halign = Gtk.Align.CENTER,
            margin = 24
        };

        options_grid.attach (width_label, 0, 0, 1, 1);
        options_grid.attach (width_entry, 1, 0, 1, 1);
        options_grid.attach (height_label, 0, 1, 1, 1);
        options_grid.attach (height_entry, 1, 1, 1, 1);
        options_grid.attach (dpi_label, 2, 0, 1, 1);
        options_grid.attach (dpi_combobox, 3, 0, 1, 1);
        options_grid.attach (unit_label, 2, 1, 1, 1);
        options_grid.attach (unit_combobox, 3, 1, 1, 1);

        var button_grid = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL) {
            hexpand = true,
            layout_style = Gtk.ButtonBoxStyle.END,
            spacing = 6,
        };
        button_grid.add (show_advanced_button);
        button_grid.add (cancel_btn);
        button_grid.add (create_btn);
        button_grid.set_child_secondary (show_advanced_button, true);

        var button_size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
        button_size_group.add_widget (show_advanced_button);
        button_size_group.add_widget (cancel_btn);
        button_size_group.add_widget (create_btn);

        var setup_grid = new Gtk.Grid () {
            margin = 12,
            orientation = Gtk.Orientation.VERTICAL,
            row_spacing = 12
        };
        setup_grid.add (options_grid);
        setup_grid.add (button_grid);

        var actionbar = new Gtk.ActionBar ();
        actionbar.get_style_context ().add_class (Gtk.STYLE_CLASS_INLINE_TOOLBAR);
        actionbar.add (setup_grid);

        var individual_grid = new Gtk.Grid ();
        individual_grid.attach (choose_template_grid, 0, 0);
        individual_grid.attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1);
        individual_grid.attach (template_view, 0, 2);
        // individual_grid.attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 3);
        individual_grid.attach (actionbar, 0, 3);

        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.pack1 (sidebar_grid, false, false);
        paned.pack2 (individual_grid, true, false);

        add (paned);
    }
}
