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
		,{text: "Twitter", link: global.link_to_twitter, menu_string: "link_to_twitter", icon: global.resource_pack_sprite_logo_twitter, is_company_link: false}
		,{text: "YouTube", link: global.link_to_youtube, menu_string: "link_to_youtube", icon: global.resource_pack_sprite_logo_youtube, is_company_link: false}

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

		if (button_info.is_company_link)
		{
			var exists_value = scr_url_exists(button_info.link);

			/* Only hide if we are sure it does not exist */
			if (exists_value == false)
			{
				should_include_button = false;

				/* If we are currently selecting a menu entry that we are hiding, move selection back safely */
				if (menu == button_info.menu_string)
				{
					menu = "links";
				}
			}
		}

		if (should_include_button)
		{
			array_push(buttons, button_info);
		}
	}

	/* Loop through the filtered buttons array */
	for (var i = 0; i < array_length(buttons); i++)
	{
		var button_info = buttons[i];
		var link_global = button_info.link;
		var link_text = button_info.text;
		var link_menu_string = button_info.menu_string;
		var link_to_y = 64 + (50 * i); /* Calculate Y position for each visible button */

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(810, link_to_y + 20, l10n_text(link_text), global.default_text_size, c_black, c_white, 1);
		draw_menu_button_sprite(spr_menu_button, 32, link_to_y, 0, 0, 2.1, 1, 370 * 2.1, 42, string(link_global), link_menu_string, link_menu_string, false);

		if (button_info.icon != noone)
		{
			draw_sprite_ext(button_info.icon, 0, 780, link_to_y + 20, 0.25, 0.25, 0, c_white, 1);
		}

		if (
			(
				(point_in_rectangle(mouse_get_x, mouse_get_y, 32, link_to_y, 32 + (370 * 2.1), link_to_y + 20 + 42))
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
			)
			|| (
				(menu == link_menu_string)
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
			)
		)
		{
			url_open(link_global);
			menu_delay = 3;
		}

		if (menu == "links")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (key_up)
			{
				menu = "information_back";
				menu_delay = 3;
			}
			else
			if (key_down)
			{
				if (array_length(buttons) > 0)
				{
					menu = buttons[0].menu_string; /* Go to first visible button */
					menu_delay = 3;
				}
			}
		}
		else
		if (menu == link_menu_string)
		&& (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (i > 0)
			{
				menu = buttons[i - 1].menu_string; /* Go to previous visible button */
			}
			else
			{
				menu = "links";
			}
			menu_delay = 3;
		}
		else
		if (menu == link_menu_string)
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (i < array_length(buttons) - 1)
			{
				menu = buttons[i + 1].menu_string; /* Go to next visible button */
			}
			else
			{
				menu = "information_back";
			}
			menu_delay = 3;
		}
		else
		if (menu == "information_back")
		&& (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (array_length(buttons) > 0)
			{
				menu = buttons[array_length(buttons) - 1].menu_string; /* Go to last visible button */
				menu_delay = 3;
			}
		}
	}
}
