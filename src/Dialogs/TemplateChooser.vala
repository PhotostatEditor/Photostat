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

        // var test_icon1 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("2k-1.66_1"),
        //     pixel_size = 128
        // };

        // var test_icon2 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("2k-4_3"),
        //     pixel_size = 128
        // };

        // var test_icon3 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("2k-1.85_1"),
        //     pixel_size = 128
        // };

        // var test_icon4 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("1080p-4_3"),
        //     pixel_size = 128
        // };

        // var test_icon5 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("1080p-16_9"),
        //     pixel_size = 128
        // };

        // var test_icon6 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("1440p-4_3"),
        //     pixel_size = 128
        // };

        // var test_icon7 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("facebook-landscape"),
        //     pixel_size = 128
        // };

        // var test_icon8 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("twitter-cover-photo"),
        //     pixel_size = 128
        // };

        // var test_icon9 = new Gtk.Image () {
        //     gicon = new ThemedIcon ("twitter-header-photo"),
        //     pixel_size = 128
        // };

        var template_view = new Gtk.FlowBox () {
            activate_on_single_click = true,
            homogeneous = true,
            selection_mode = Gtk.SelectionMode.SINGLE
        };
        template_view.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);

        // template_view.add (test_icon1);
        // template_view.add (test_icon2);
        // template_view.add (test_icon3);
        // template_view.add (test_icon4);
        // template_view.add (test_icon5);
        // template_view.add (test_icon6);
        // template_view.add (test_icon7);
        // template_view.add (test_icon8);
        // template_view.add (test_icon9);

        var template_button = new Photostat.Widgets.TemplateButton ("facebook-landscape");
        var template_button2 = new Photostat.Widgets.TemplateButton ("twitter-cover-photo");

        template_view.add (template_button);
        template_view.add (template_button2);

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

        var next_btn = new Gtk.Button.with_label (_("Next"));
        next_btn.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        cancel_btn = new Gtk.Button.with_label (_("Cancel"));

        cancel_btn.clicked.connect (() => {
            destroy ();
        });

        destroy.connect (() => {
            _window.accept_focus = true;
        });

        var name_label = new Gtk.Label (_("Name:")) {
            halign = Gtk.Align.END
        };
        var name_entry = new Gtk.Entry ();

        var unit_label = new Gtk.Label (_("Units:")) {
            halign = Gtk.Align.END
        };

        var unit_combobox = new Gtk.ComboBoxText ();
        unit_combobox.append_text ("Pixels (px)");
        unit_combobox.append_text ("Points (pt)");
        unit_combobox.append_text ("Pica (pc)");
        unit_combobox.append_text ("Millimetres (mm)");
        unit_combobox.append_text ("Centimetres (cm)");
        unit_combobox.append_text ("Inches (in)");
        unit_combobox.active = 0;

        var width_label = new Gtk.Label (_("Width:")) {
            halign = Gtk.Align.END,
            margin_start = 32
        };
        var width_entry = new Gtk.SpinButton.with_range (1, 99999, 1);

        var height_label = new Gtk.Label (_("Height:")) {
            halign = Gtk.Align.END,
            margin_start = 32
        };
        var height_entry = new Gtk.SpinButton.with_range (1, 99999, 1);

        var size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
        size_group.add_widget (width_entry);
        size_group.add_widget (height_entry);
        size_group.add_widget (name_entry);
        size_group.add_widget (unit_combobox);

        var options_grid = new Gtk.Grid () {
            column_spacing = 12,
            row_spacing = 12,
            halign = Gtk.Align.CENTER,
            margin = 24
        };

        options_grid.attach (name_label, 0, 0, 1, 1);
        options_grid.attach (name_entry, 1, 0, 1, 1);
        options_grid.attach (unit_label, 0, 1, 1, 1);
        options_grid.attach (unit_combobox, 1, 1, 1, 1);
        options_grid.attach (width_label, 2, 0, 1, 1);
        options_grid.attach (width_entry, 3, 0, 1, 1);
        options_grid.attach (height_label, 2, 1, 1, 1);
        options_grid.attach (height_entry, 3, 1, 1, 1);

        var button_grid = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL) {
            hexpand = true,
            layout_style = Gtk.ButtonBoxStyle.END,
            spacing = 6,
        };
        button_grid.add (cancel_btn);
        button_grid.add (next_btn);

        var button_size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
        button_size_group.add_widget (cancel_btn);
        button_size_group.add_widget (next_btn);

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
        individual_grid.attach (actionbar, 0, 3);

        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.pack1 (sidebar_grid, false, false);
        paned.pack2 (individual_grid, true, false);

        var layout_header = new Granite.HeaderLabel ("Layout");

        var document_name_label = new Gtk.Label ("Document Name:") {
            halign = Gtk.Align.END
        };
        var document_name_entry = new Gtk.Entry ();

        var document_units_label = new Gtk.Label ("Document Units:") {
            halign = Gtk.Align.END
        };
        var document_units_combobox = new Gtk.ComboBoxText ();
        document_units_combobox.append_text ("Pixels (px)");
        document_units_combobox.append_text ("Points (pt)");
        document_units_combobox.append_text ("Pica (pc)");
        document_units_combobox.append_text ("Millimetres (mm)");
        document_units_combobox.append_text ("Centimetres (cm)");
        document_units_combobox.append_text ("Inches (in)");
        document_units_combobox.active = 0;

        var page_width_label = new Gtk.Label ("Page Width:") {
            halign = Gtk.Align.END
        };
        var page_width_entry = new Gtk.SpinButton.with_range (1, 99999, 1);

        var page_height_label = new Gtk.Label ("Page Height:") {
            halign = Gtk.Align.END
        };
        var page_height_entry = new Gtk.SpinButton.with_range (1, 99999, 1);

        var dpi_label = new Gtk.Label ("DPI:") {
            halign = Gtk.Align.END
        };

        var dpi_combobox = new Gtk.ComboBoxText.with_entry ();
        dpi_combobox.append_text ("72");
        dpi_combobox.append_text ("300");
        dpi_combobox.append_text ("400");
        dpi_combobox.append_text ("600");
        dpi_combobox.append_text ("1000");
        dpi_combobox.append_text ("1200");
        dpi_combobox.active = 0;

        var dc_size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
        dc_size_group.add_widget (dpi_combobox);
        dc_size_group.add_widget (document_units_combobox);

        var orientation_label = new Gtk.Label (_("Orientation:")) {
            halign = Gtk.Align.END
        };

        var orientation_modebutton = new Granite.Widgets.ModeButton ();
        orientation_modebutton.append_text (_("Landscape"));
        orientation_modebutton.append_text (_("Portrait"));

        var color_header = new Granite.HeaderLabel ("Color");

        var color_format_label = new Gtk.Label (_("Color Format:")) {
            halign = Gtk.Align.END
        };
        var color_format_combobox = new Gtk.ComboBoxText ();
        color_format_combobox.append_text (("RGB/8"));
        color_format_combobox.append_text (("RGB/16"));
        color_format_combobox.append_text (("RGB/32"));
        color_format_combobox.append_text (("Grey/8"));
        color_format_combobox.append_text (("Grey/16"));
        color_format_combobox.append_text (("CMYK/8"));
        color_format_combobox.append_text (("LAB/16"));
        color_format_combobox.active = 0;

        var color_profile_label = new Gtk.Label (_("Color Profile:")) {
            halign = Gtk.Align.END
        };
        var color_profile_combobox = new Gtk.ComboBoxText ();
        color_profile_combobox.append_text ("sRGB");
        color_profile_combobox.append_text ("Adobe RGB (1998)");
        color_profile_combobox.append_text ("Apple RGB");
        color_profile_combobox.append_text ("ColorMatch RGB");
        color_profile_combobox.active = 0;

        var transperant_label = new Gtk.Label (_("Transperant Background:")) {
            halign = Gtk.Align.END
        };

        var transperant_switch = new Gtk.Switch () {
            halign = Gtk.Align.START
        };

        var margin_header = new Granite.HeaderLabel (_("Margins"));

        var include_margin = new Gtk.Label (_("Include Margins:")) {
            halign = Gtk.Align.END
        };

        var margin_switch = new Gtk.Switch () {
            halign = Gtk.Align.START
        };

        var left_margin = new Gtk.Label (_("Left:")) {
            halign = Gtk.Align.END
        };
        var left_margin_entry = new Gtk.SpinButton.with_range (0, 9999, 1) {
            sensitive = false
        };

        var right_margin = new Gtk.Label (_("Right:")) {
            halign = Gtk.Align.END
        };
        var right_margin_entry = new Gtk.SpinButton.with_range (0, 9999, 1) {
            sensitive = false
        };

        var top_margin = new Gtk.Label (_("Top:")) {
            halign = Gtk.Align.END
        };
        var top_margin_entry = new Gtk.SpinButton.with_range (0, 9999, 1) {
            sensitive = false
        };

        var bottom_margin = new Gtk.Label (_("Botom:")) {
            halign = Gtk.Align.END
        };
        var bottom_margin_entry = new Gtk.SpinButton.with_range (0, 9999, 1) {
            sensitive = false
        };

        var back_btn = new Gtk.Button.with_label (_("Back"));

        var create_btn = new Gtk.Button.with_label (_("Create"));
        create_btn.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);

        var advanced_button_grid = new Gtk.ButtonBox (Gtk.Orientation.HORIZONTAL) {
            hexpand = true,
            layout_style = Gtk.ButtonBoxStyle.END,
            spacing = 6,
            margin_end = 18
        };
        advanced_button_grid.add (back_btn);
        advanced_button_grid.add (create_btn);

        var advanced_button_size_group = new Gtk.SizeGroup (Gtk.SizeGroupMode.HORIZONTAL);
        advanced_button_size_group.add_widget (back_btn);
        advanced_button_size_group.add_widget (create_btn);

        var advanced_grid = new Gtk.Grid () {
            column_spacing = 12,
            row_spacing = 12,
            margin_top = 16,
            margin_bottom = 12,
            halign = Gtk.Align.CENTER
        };
        advanced_grid.attach (layout_header, 0, 0, 2);
        advanced_grid.attach (document_name_label, 0, 1, 2);
        advanced_grid.attach (document_name_entry, 2, 1, 2);
        advanced_grid.attach (page_width_label, 0, 2, 2);
        advanced_grid.attach (page_width_entry, 2, 2, 2);
        advanced_grid.attach (page_height_label, 0, 3, 2);
        advanced_grid.attach (page_height_entry, 2, 3, 2);
        advanced_grid.attach (orientation_label, 0, 4, 2);
        advanced_grid.attach (orientation_modebutton, 2, 4, 2);
        advanced_grid.attach (document_units_label, 0, 5);
        advanced_grid.attach (document_units_combobox, 1, 5);
        advanced_grid.attach (dpi_label, 2, 5);
        advanced_grid.attach (dpi_combobox, 3, 5);
        advanced_grid.attach (color_header, 0, 6, 2);
        advanced_grid.attach (color_format_label, 0, 7, 2);
        advanced_grid.attach (color_format_combobox, 2, 7, 2);
        advanced_grid.attach (color_profile_label, 0, 8, 2);
        advanced_grid.attach (color_profile_combobox, 2, 8, 2);
        advanced_grid.attach (transperant_label, 0, 9, 2);
        advanced_grid.attach (transperant_switch, 2, 9, 2);
        advanced_grid.attach (margin_header, 0, 10, 2);
        advanced_grid.attach (include_margin, 0, 11, 2);
        advanced_grid.attach (margin_switch, 2, 11, 2);
        advanced_grid.attach (left_margin, 0, 12);
        advanced_grid.attach (left_margin_entry, 1, 12);
        advanced_grid.attach (right_margin, 2, 12);
        advanced_grid.attach (right_margin_entry, 3, 12);
        advanced_grid.attach (top_margin, 0, 13);
        advanced_grid.attach (top_margin_entry, 1, 13);
        advanced_grid.attach (bottom_margin, 2, 13);
        advanced_grid.attach (bottom_margin_entry, 3, 13);

        var advanced_box = new Gtk.Grid ();
        advanced_box.attach (advanced_grid, 0, 0);
        advanced_box.attach (advanced_button_grid, 0, 1);

        var deck = new Hdy.Deck () {
            can_swipe_back = true,
            expand = true
        };
        deck.add (paned);
        deck.add (advanced_box);

        var handle = new Hdy.WindowHandle ();
        handle.add (deck);

        add (handle);

        next_btn.clicked.connect (() => {
            deck.visible_child = advanced_box;
        });

        back_btn.clicked.connect (() => {
            deck.visible_child = paned;
        });

        margin_switch.notify["active"].connect (() => {
            if (margin_switch.active) {
                top_margin_entry.sensitive = true;
                bottom_margin_entry.sensitive = true;
                left_margin_entry.sensitive = true;
                right_margin_entry.sensitive = true;
            } else {
                top_margin_entry.sensitive = false;
                bottom_margin_entry.sensitive = false;
                right_margin_entry.sensitive = false;
                left_margin_entry.sensitive = false;
            }
        });
    }
}
