/* First update the language pack */
scr_language_pack_update(false);

/* Then set default language */
scr_set_default_language(false);

/* If there are missing translation keywords that have not yet been sent, do that now */
scr_check_daily_translation_flush();