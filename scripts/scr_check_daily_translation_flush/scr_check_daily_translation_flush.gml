/// Legacy automatic translation diagnostics are outside the v1 allowlist.
/// Translation lookup/fallback and player-requested language updates remain separate.
/// Never persist, enqueue, upload or log arbitrary translation keys here.
function scr_check_daily_translation_flush()
{
    return false;
}
