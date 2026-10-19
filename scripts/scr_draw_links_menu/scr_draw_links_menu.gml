function scr_draw_links_menu()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);

	var buttons_all = noone;
	var buttons = [];
	
	/* Define an array of button information (master list) */
	buttons_all = [
		/* Social Media Links */
		{text: "Discord", link: global.link_to_discord, menu_string: "link_to_discord", icon: global.resource_pack_sprite_logo_discord, is_company_link: false}
		,{text: "Gamebanana", link: global.link_to_gamebanana, menu_string: "link_to_gamebanana", icon: global.resource_pack_sprite_logo_gamebanana, is_company_link: false}
		,{text: "Instagram", link: global.link_to_instagram, menu_string: "link_to_instagram", icon: global.resource_pack_sprite_logo_instagram, is_company_link: false}
		,{text: "Reddit", link: global.link_to_reddit, menu_string: "link_to_reddit", icon: global.resource_pack_sprite_logo_reddit, is_company_link: false}
		//,{text: "Twitter", link: global.link_to_twitter, menu_string: "link_to_twitter", icon: global.resource_pack_sprite_logo_twitter, is_company_link: false}
		,{text: "Bluesky", link: global.link_to_bluesky, menu_string: "link_to_bluesky", icon: global.resource_pack_sprite_logo_bluesky, is_company_link: false}
		,{text: "YouTube", link: global.link_to_youtube, menu_string: "link_to_youtube", icon: global.resource_pack_sprite_logo_youtube, is_company_link: false}
		,{text: "GitHub", link: global.link_to_github, menu_string: "link_to_github", icon: global.resource_pack_sprite_logo_github, is_company_link: false}

		/* Other Links (Company Links) */
		,{text: "Bug Report Form", link: global.link_to_bug_report_form, menu_string: "link_to_bug_report_form", icon: noone, is_company_link: true}
		,{text: "Changelog History", link: global.link_to_changelog_history, menu_string: "link_to_changelog_history", icon: noone, is_company_link: true}
		,{text: "Guide", link: global.link_to_website_guide, menu_string: "link_to_website_guide", icon: noone, is_company_link: true}
		,{text: "Steam Page", link: global.link_to_steam_page, menu_string: "link_to_steam_page", icon: noone, is_company_link: false}
		,{text: "Update Schedule", link: global.link_to_update_schedule, menu_string: "link_to_update_schedule", icon: noone, is_company_link: true}
		,{text: "Website", link: global.link_to_website, menu_string: "link_to_website", icon: noone, is_company_link: true}
		,{text: "Wiki", link: global.link_to_wiki, menu_string: "link_to_wiki", icon: global.resource_pack_sprite_logo_wiki, is_company_link: true}
	];

	/* Build a filtered array that hides confirmed-dead company links */
	for (var i = 0; i < array_length(buttons_all); i++)
	{
		var button_info = buttons_all[i];
		var should_include_button = true;

		if (button_info.link == "")
		{
			should_include_button = false;
		}
		else
		if (button_info.is_company_link)
		{
			var exists_value = scr_url_exists(button_info.link);

			/* Only hide if we are sure it does not exist */
			if (exists_value == false)
			{
				should_include_button = false;

			}
		}

		if (should_include_button)
		{
			array_push(buttons, button_info);
		}
		else
		if (menu == button_info.menu_string)
		{
			menu = "links"; /* Move focus away from a link that became empty or unavailable */
		}
	}

	var links_count = array_length(buttons);
	var links_view_top = 64;
	var links_view_bottom = display_get_gui_height() - 50;
	var links_visible_count = max(0, floor((links_view_bottom - links_view_top - 42) / 50) + 1);
	var links_scroll_max = max(0, links_count - links_visible_count);
	var links_can_scroll = (links_visible_count > 0 && links_scroll_max > 0);
	var links_input_ready = (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!scr_block_menu_input_for_network_request());
	var links_selected_index = -1;
	var links_scroll_button_y = display_get_gui_height() - 42;
	var links_scroll_button_width = min(185, max(1, floor((display_get_gui_width() - 370) / 2)));

	links_scroll_start = clamp(floor(links_scroll_start), 0, links_scroll_max);

	/* Focusing the Links tab starts at the top, including when returning from another tab */
	if (menu == "links")
	{
		links_scroll_start = 0;
	}
	else
	if (!links_can_scroll
	&& (menu == "links_scroll_up" || menu == "links_scroll_down"))
	{
		menu = "links";
	}

	for (var i = 0; i < links_count; i++)
	{
		if (menu == buttons[i].menu_string)
		{
			links_selected_index = i;
			break;
		}
	}

	/* Keyboard navigation follows the whole filtered list, including rows outside the viewport */
	if (links_input_ready)
	{
		if (menu == "links")
		{
			if (key_up)
			{
				menu = "information_back";
				menu_delay = 3;
			}
			else
			if (key_down && links_count > 0)
			{
				links_selected_index = 0;
				menu = buttons[links_selected_index].menu_string;
				menu_delay = 3;
			}
		}
		else
		if (links_selected_index >= 0)
		{
			if (key_up)
			{
				links_selected_index -= 1;
				menu = (links_selected_index >= 0) ? buttons[links_selected_index].menu_string : "links";
				menu_delay = 3;
			}
			else
			if (key_down)
			{
				links_selected_index += 1;
				menu = (links_selected_index < links_count) ? buttons[links_selected_index].menu_string : "information_back";
				menu_delay = 3;
			}
		}
		else
		if (menu == "information_back" && key_up && links_count > 0)
		{
			links_selected_index = links_count - 1;
			menu = buttons[links_selected_index].menu_string;
			menu_delay = 3;
		}
		else
		if (menu == "links_scroll_up" || menu == "links_scroll_down")
		{
			if (key_up || key_down)
			{
				if (links_count > 0 && links_visible_count > 0)
				{
					links_selected_index = key_up ? min(links_count - 1, links_scroll_start + links_visible_count - 1) : links_scroll_start;
					menu = buttons[links_selected_index].menu_string;
				}
				else
				{
					menu = "information_back";
				}
				menu_delay = 3;
			}
		}
	}

	if (links_selected_index >= 0 && links_selected_index < links_count && links_visible_count > 0)
	{
		if (links_selected_index < links_scroll_start)
		{
			links_scroll_start = links_selected_index;
		}
		else
		if (links_selected_index >= links_scroll_start + links_visible_count)
		{
			links_scroll_start = links_selected_index - links_visible_count + 1;
		}
	}

	/* Mouse scrolling moves one row and clears focus from any row it hides */
	if (links_can_scroll && links_input_ready && menu_delay == 0)
	{
		var links_scroll_change = 0;
		var links_mouse_in_view = point_in_rectangle(mouse_get_x, mouse_get_y, 0, links_view_top, display_get_gui_width(), links_view_bottom);
		var links_scroll_up_mouse = point_in_rectangle(mouse_get_x, mouse_get_y, 0, links_scroll_button_y, links_scroll_button_width, links_scroll_button_y + 42)
			&& mouse_check_button_released(mb_left);
		var links_scroll_down_mouse = point_in_rectangle(mouse_get_x, mouse_get_y, links_scroll_button_width, links_scroll_button_y, links_scroll_button_width * 2, links_scroll_button_y + 42)
			&& mouse_check_button_released(mb_left);

		if ((links_mouse_in_view && mouse_wheel_up()) || links_scroll_up_mouse
		|| (menu == "links_scroll_up" && key_accept_pressed))
		{
			links_scroll_change = -1;
		}
		else
		if ((links_mouse_in_view && mouse_wheel_down()) || links_scroll_down_mouse
		|| (menu == "links_scroll_down" && key_accept_pressed))
		{
			links_scroll_change = 1;
		}

		if (links_scroll_change != 0)
		{
			links_scroll_start = clamp(links_scroll_start + links_scroll_change, 0, links_scroll_max);
			menu = (links_scroll_change < 0) ? "links_scroll_up" : "links_scroll_down";
			menu_delay = 3;
		}
	}

	/* Only visible rows are drawn or allowed to open a link */
	for (var i = links_scroll_start; i < min(links_count, links_scroll_start + links_visible_count); i++)
	{
		var button_info = buttons[i];
		var link_global = button_info.link;
		var link_text = button_info.text;
		var link_menu_string = button_info.menu_string;
		var link_to_y = links_view_top + (50 * (i - links_scroll_start));

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(810, link_to_y + 20, l10n_text(link_text), global.default_text_size, c_black, c_white, 1);
		draw_menu_button_sprite(spr_menu_button, 32, link_to_y, 0, 0, 2.1, 1, 370 * 2.1, 42, string(link_global), link_menu_string, link_menu_string, false);

		if (button_info.icon != noone && sprite_exists(button_info.icon))
		{
			var link_icon_scale = 32 / max(1, max(sprite_get_width(button_info.icon), sprite_get_height(button_info.icon)));
			draw_sprite_ext(button_info.icon, 0, 780, link_to_y + 20, link_icon_scale, link_icon_scale, 0, c_white, 1);
		}

		if (!scr_block_menu_input_for_network_request()
		&& (
			(
				(point_in_rectangle(mouse_get_x, mouse_get_y, 32, link_to_y, 32 + (370 * 2.1), link_to_y + 42))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
			)
			|| (
				(menu == link_menu_string)
				&& (key_accept_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
			)
		))
		{
			url_open(link_global);
			menu_delay = 3;
		}
	}

	if (links_can_scroll)
	{
		var links_up_alpha = (links_scroll_start > 0) ? 1 : 0.4;
		var links_down_alpha = (links_scroll_start < links_scroll_max) ? 1 : 0.4;
		draw_menu_button_sprite(spr_menu_button, 0, links_scroll_button_y, 0, 0, links_scroll_button_width / 370, 1, links_scroll_button_width, 42, l10n_text("Up"), "links_scroll_up", "links_scroll_up", false, c_lime, links_up_alpha);
		draw_menu_button_sprite(spr_menu_button, links_scroll_button_width, links_scroll_button_y, 0, 0, links_scroll_button_width / 370, 1, links_scroll_button_width, 42, l10n_text("Down"), "links_scroll_down", "links_scroll_down", false, c_lime, links_down_alpha);
	}
}
