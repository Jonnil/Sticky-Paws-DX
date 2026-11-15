/// Development-only. Run the same UTF-8 corpus against the actual GML validator
/// and the isolated receiver; never registered in the shipping game project.
function tlm_run_contract_tests()
{
    var _bytes = tlm_native_read("contract_cases.json", 200000);
    var _cases = tlm_json_parse(_bytes, 200000, 8);
    if (!is_array(_cases)) return {passed:false,total:0,results:[],reason:"missing_contract_corpus"};
    var _results = [], _passed = true;
    for (var _i = 0; _i < array_length(_cases); _i++)
    {
        var _case = _cases[_i];
        var _observed = tlm_validate_report(tlm_json_parse(_case.body), true);
        var _ok = _observed == _case.accepted;
        _passed = _passed && _ok;
        array_push(_results, {name:_case.name,expected:_case.accepted,accepted:_observed,ok:_ok});
    }
    var _previous = global.telemetry;
    tlm_test_new();
    var _off = is_undefined(scr_telemetry_safe_frames(["gml_Script_tlm_step (line 12)"]));
    array_push(_results, {name:"frame_parser_off",expected:true,accepted:_off,ok:_off});
    _passed = _passed && _off;
    var _enabled = tlm_test_enable_local();
    var _ready = _enabled && tlm_authored_frames_ready("sp-telemetry-v1-dev");
    array_push(_results, {name:"authored_registry_ready",expected:true,accepted:_ready,ok:_ready});
    _passed = _passed && _ready;
    var _frames = scr_telemetry_safe_frames([
        "gml_Script_tlm_step (line 12) - PRIVATE_TEXT_MUST_NOT_APPEAR",
        "gml_Object_obj_debug_manager_Step_0 (line 3)",
        "PRIVATE_TEXT_MUST_NOT_APPEAR gml_Script_tlm_step (line 4)",
        "gml_Script_unregistered_user_name (line 1)"
    ]);
    var _mapped = is_array(_frames) && array_length(_frames) == 2;
    if (_mapped) _mapped = _frames[0].resource == "scr_telemetry_core" && _frames[0].line == 12
        && _frames[1].resource == "obj_debug_manager" && _frames[1].event == "Step_0"
        && string_pos("PRIVATE_TEXT", json_stringify(_frames)) == 0;
    array_push(_results, {name:"frame_parser_exact_authored_mapping",expected:true,accepted:_mapped,ok:_mapped});
    _passed = _passed && _mapped;
    tlm_apply_choice("error.frames", false);
    var _declined = is_undefined(scr_telemetry_safe_frames(["gml_Script_tlm_step (line 12)"]));
    array_push(_results, {name:"frame_parser_declined",expected:true,accepted:_declined,ok:_declined});
    _passed = _passed && _declined;
    global.telemetry = _previous;
    return {passed:_passed,total:array_length(_results),results:_results};
}
