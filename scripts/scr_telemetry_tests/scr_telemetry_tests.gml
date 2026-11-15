/// Development harness only. Do not register in the released project. These
/// tests execute the actual GML core against memory storage and fake transport.
/// No player profile, production destination or legacy report is accessed.
function tlm_test_fixture() {
    var _f={files:{},now:1000000000,writes:0,reads:0,starts:0,nonce:0,requests:[],fail_write:false,fail_control:false,fail_remove:false,fail_guard:false,notice:true,start_failure:false,os_reads:0,memory_reads:0};
    _f.read=method(_f,function(_path,_limit) {
        ++reads;
        if(string_pos("telemetry_notice.txt",_path)>0) return notice ? "sticky-diagnostics-1\nfields:sticky-diagnostics-fields-1\nSynthetic fixture notice.\n" : undefined;
        var _value=tlm_get(files,_path,undefined);
        if(is_string(_value) && string_byte_length(_value)<=_limit) return _value;
        return undefined;
    });
    _f.write=method(_f,function(_path,_text) {
        ++writes;
        if(fail_write || (fail_guard && string_pos("guard.json",_path)>0) || (fail_control && string_pos("control_",_path)>0)) return false;
        variable_struct_set(files,_path,_text);return true;
    });
    _f.remove=method(_f,function(_path) {
        if(fail_remove) return false;
        if(tlm_has(files,_path)) variable_struct_remove(files,_path);
        return true;
    });
    _f.ensure=function(_path) {return true;};
    _f.inventory=method(_f,function(_root) {
        var _entries=[];var _names=variable_struct_get_names(files);
        for(var _i=0;_i<array_length(_names);++_i) if(string_pos(_root,_names[_i])==1) {
            var _name=string_delete(_names[_i],1,string_length(_root));
            if(!is_undefined(tlm_managed_name(_name))) array_push(_entries,{name:_name,bytes:string_byte_length(variable_struct_get(files,_names[_i]))});
        }
        return _entries;
    });
    _f.clock=method(_f,function() {return now;});
    _f.os_release=method(_f,function() {++os_reads;return "windows_11";});
    _f.memory_mib=method(_f,function() {++memory_reads;return 128;});
    _f.secure_id=method(_f,function() {
        // Deterministic fixture IDs are never used by the player adapter.
        ++nonce;var _digits=string(nonce);return string_repeat("0",32-string_length(_digits))+_digits;
    });
    _f.sha256=function(_text) {return tlm_platform_sha256(_text);};
    _f.start=method(_f,function(_body) {
        ++starts;array_push(requests,_body);return start_failure ? -1 : 100+starts;
    });
    _f.cancel=function(_request) {return false;};
    return _f;
}
function tlm_test_new(_fixture=undefined) {
    var _f=is_undefined(_fixture) ? tlm_test_fixture() : _fixture;
    global.telemetry=undefined;
    tlm_init("synthetic-profile/","sp-telemetry-v1-dev",_f);
    return _f;
}
function tlm_test_assert(_condition,_label,_results) {
    array_push(_results,{label:_label,passed:bool(_condition)});
    if(!_condition) show_debug_message("TELEMETRY TEST FAILED: "+_label);
}
function tlm_test_enable_local() {
    return tlm_apply_choice("enabled",true).ok && tlm_apply_choice("keep_local",true).ok;
}
function tlm_test_enable_remote() {
    global.telemetry.remote_available=true;
    global.telemetry.destination="Synthetic isolated receiver (memory fixture)";
    return tlm_apply_choice("enabled",true).ok && tlm_apply_choice("auto_crash",true).ok;
}
function tlm_test_callback(_status,_http,_body,_request=undefined) {
    var _map=ds_map_create();
    var _request2=is_undefined(_request) && !is_undefined(global.telemetry.active) ? global.telemetry.active.request_id : _request;
    _map[? "id"]=_request2;_map[? "status"]=_status;_map[? "http_status"]=_http;_map[? "result"]=_body;
    var _result=tlm_http(_map);ds_map_destroy(_map);return _result;
}
function tlm_test_ack(_active) {
    return json_stringify({status:"stored",report_id:_active.report_id,schema_version:1,payload_sha256:_active.payload_sha256});
}
function tlm_run_tests() {
    var _previous=variable_global_exists("telemetry") ? global.telemetry : undefined;
    var _results=[];
    try {
        var _f=tlm_test_new();
        for(var _i=0;_i<3;++_i) {tlm_step();tlm_capture_crash("unclassified",{mode:"editor",content_origin:"custom"});++_f.now;}
        tlm_test_assert(_f.writes==0 && _f.starts==0 && _f.os_reads==0 && _f.memory_reads==0 && array_length(global.telemetry.records)==0 && array_length(global.telemetry.samples)==0,"T01 fresh Off has zero automatic writes/samples/device reads/requests",_results);
        tlm_test_assert(!tlm_apply_choice("auto_crash",true).ok,"Unverified receiver cannot be enabled",_results);
        tlm_test_assert(tlm_test_enable_local(),"Local opt-in persists and arms session",_results);
        tlm_test_assert(tlm_capture_crash("unclassified",{mode:"editor",content_origin:"custom"}),"T02 minimal safe local capture",_results);
        var _listed=tlm_list();var _minimal=tlm_json_parse(_listed[0].body);
        tlm_test_assert(tlm_validate_report(_minimal,false) && !tlm_has(_minimal,"context") && !tlm_has(_minimal,"performance") && !tlm_has(_minimal,"submission_mode"),"T02 local candidate has core only and no mode",_results);
        tlm_test_assert(!tlm_has(_minimal,"user_id") && string_pos("synthetic-profile",_listed[0].body)==0,"T03 profile path excluded from body",_results);

        tlm_test_assert(tlm_apply_choice("context",true).ok,"Category can be deliberately selected",_results);
        tlm_test_assert(tlm_capture_crash("level_load",{mode:"editor",content_origin:"custom"}),"Selected typed context capture",_results);
        _listed=tlm_list();var _context=tlm_json_parse(_listed[array_length(_listed)-1].body);
        tlm_test_assert(tlm_has(_context,"context") && _context.context.mode=="editor" && _context.context.content_origin=="custom","Selected known context fields included",_results);
        tlm_apply_choice("context.mode",false);tlm_apply_choice("context",false);tlm_apply_choice("context",true);
        tlm_test_assert(!tlm_get(global.telemetry.choices.fields,"context.mode",true),"Explicit child refusal survives category cycle",_results);
        tlm_capture_crash("unclassified",{mode:"editor",content_origin:"custom",username:"Synthetic forbidden marker"});
        _listed=tlm_list();var _badcontext=tlm_json_parse(_listed[array_length(_listed)-1].body);
        tlm_test_assert(!tlm_has(_badcontext,"context"),"T13 unknown input context rejected before collection",_results);
        tlm_apply_choice("device",true);tlm_apply_choice("performance",true);tlm_step();tlm_capture_crash("unclassified");
        _listed=tlm_list();var _device=tlm_json_parse(_listed[array_length(_listed)-1].body);
        tlm_test_assert(_device.environment.os_release=="windows_11" && _device.performance.process_memory_mib==128 && _f.os_reads==1 && _f.memory_reads==1,"Permitted coarse device and memory adapter values only",_results);

        var _valid=tlm_core_report("unclassified");_valid.submission_mode="manual";
        tlm_test_assert(tlm_validate_report(_valid,true),"Core report validates",_results);
        var _bad=tlm_copy(_valid);_bad.error.secret="Synthetic forbidden marker";
        tlm_test_assert(!tlm_validate_report(_bad,true),"T13 nested extra field rejected",_results);
        _bad=tlm_copy(_valid);_bad.schema_version=true;
        tlm_test_assert(!tlm_validate_report(_bad,true),"Boolean cannot substitute for schema integer",_results);
        _bad=tlm_copy(_valid);_bad.performance={fps_mean:60};
        tlm_test_assert(!tlm_validate_report(_bad,true),"FPS requires real sample count",_results);
        _bad=tlm_copy(_valid);_bad.error.frames=[{resource:"unregistered_script"}];
        tlm_test_assert(!tlm_validate_report(_bad,true),"Unregistered code location rejected",_results);
        if(global.telemetry.frames_supported) {
            var _registered_frame={resource:"scr_telemetry_core",event:"tlm_step",line:1};
            tlm_test_assert(tlm_validate_frame(_registered_frame),"Authored frame registry accepts a registered core resource",_results);
            tlm_capture_crash("unclassified",undefined,[_registered_frame,{resource:"unregistered_script",secret:"Synthetic forbidden marker"}]);
            _listed=tlm_list();var _framed=tlm_json_parse(_listed[array_length(_listed)-1].body);
            tlm_test_assert(tlm_has(_framed.error,"frames") && array_length(_framed.error.frames)==1,"Permitted producer keeps only authored closed frames",_results);
            tlm_apply_choice("error.frames",false);tlm_capture_crash("unclassified",undefined,[_registered_frame]);
            _listed=tlm_list();_framed=tlm_json_parse(_listed[array_length(_listed)-1].body);
            tlm_test_assert(!tlm_has(_framed.error,"frames"),"Advanced frame refusal removes frames throughout capture",_results);
        }
        var _escaped_duplicate="{\"a\":1,\""+chr(92)+"u0061\":2}";
        tlm_test_assert(is_undefined(tlm_json_parse("{\"a\":1,\"a\":2}")) && is_undefined(tlm_json_parse(_escaped_duplicate)),"T13 duplicate decoded JSON keys rejected",_results);
        tlm_test_assert(is_undefined(tlm_json_parse("{\"a\":1,}")) && is_undefined(tlm_json_parse("{\"a\":[[[[[]]]]]}")),"Trailing commas and excessive nesting rejected",_results);
        tlm_test_assert(is_undefined(tlm_json_parse("{\"x\":NaN}")) && is_undefined(tlm_json_parse(string_repeat("x",65537))),"Non-JSON number and oversized body rejected",_results);
        var _manykeys="{";
        for(var _key_number=0;_key_number<1000;++_key_number) {_manykeys+=(_key_number==0 ? "" : ",")+"\"key"+string(_key_number)+"\":0";}
        _manykeys+="}";
        var _parsed_many=tlm_json_parse(_manykeys);
        tlm_test_assert(is_struct(_parsed_many) && array_length(variable_struct_get_names(_parsed_many))==1000 && !tlm_validate_report(_parsed_many,true),"T13 large unknown-key object parses boundedly and fails closed schema",_results);

        _f=tlm_test_new();tlm_test_enable_local();_f.fail_write=true;
        tlm_test_assert(!tlm_apply_choice("enabled",false).ok && !tlm_capture_crash("unclassified"),"T06 failed restrictive save stops capture immediately",_results);
        _f.fail_write=false;tlm_test_new(_f);
        tlm_test_assert(global.telemetry.paused && !tlm_capture_crash("unclassified"),"T06 armed restart never resumes old grant",_results);
        _f=tlm_test_new();_f.fail_write=true;
        tlm_test_assert(!tlm_apply_choice("enabled",true).ok && !tlm_capture_crash("unclassified"),"T06 failed enabling save never starts capture",_results);
        _f=tlm_test_new();tlm_test_enable_local();tlm_shutdown();
        var _newest_slot=global.telemetry.slot==0 ? "control_a.json" : "control_b.json";
        variable_struct_set(_f.files,global.telemetry.root+_newest_slot,"{damaged");tlm_test_new(_f);
        tlm_test_assert(global.telemetry.paused && !tlm_capture_crash("unclassified"),"T05 corrupt newest slot cannot revive older on snapshot after clean exit",_results);
        _f=tlm_test_new();tlm_apply_choice("enabled",true);_f.fail_guard=true;
        tlm_test_assert(!tlm_apply_choice("keep_local",true).ok && !tlm_capture_crash("unclassified"),"T06 failed arm keeps collection paused",_results);
        _f=tlm_test_fixture();_f.notice=false;tlm_test_new(_f);
        tlm_test_assert(!tlm_apply_choice("enabled",true).ok,"Missing bundled notice fails closed",_results);
        _f=tlm_test_new();
        variable_struct_set(_f.files,global.telemetry.root+"control_a.json","{\"schema\":2}");tlm_test_new(_f);
        tlm_test_assert(global.telemetry.unsupported && !tlm_apply_choice("enabled",true).ok,"T05 future preference schema preserved and paused",_results);

        _f=tlm_test_new();tlm_test_enable_local();
        for(var _j=0;_j<25;++_j) {tlm_capture_crash("unclassified");++_f.now;}
        tlm_test_assert(array_length(global.telemetry.records)<=20,"T07 local record count cap evicts oldest",_results);
        _f.now+=15*86400;tlm_cleanup();
        tlm_test_assert(array_length(global.telemetry.records)==0,"T07 local age expiry removes bodies",_results);
        _f=tlm_test_new();tlm_test_enable_local();tlm_capture_crash("unclassified");_f.fail_remove=true;_f.now+=15*86400;tlm_cleanup();
        tlm_test_assert(global.telemetry.records[0].state=="expired" && global.telemetry.records[0].reason=="cleanup_failed","T15 failed expiry deletion stays visible and ineligible",_results);
        _f=tlm_test_new();tlm_test_enable_local();_f.fail_control=true;_f.fail_remove=true;
        tlm_test_assert(!tlm_capture_crash("unclassified") && array_length(global.telemetry.records)==1 && global.telemetry.records[0].state=="discarded","T07 failed index plus deletion retains ineligible occupancy",_results);
        _f.fail_control=false;tlm_test_new(_f);
        var _orphan_inventory=tlm_inventory();var _orphan_list=tlm_list();
        tlm_test_assert(array_length(_orphan_inventory.orphans)==1 && _orphan_list[0].state=="unindexed","Restart inventories orphan name/bytes without enrollment",_results);
        var _root=global.telemetry.root;
        for(var _or=1;_or<=20;++_or) {var _digits=string(_or);variable_struct_set(_f.files,_root+"local_"+string_repeat("0",32-string_length(_digits))+_digits+".json",string_repeat("x",65536));}
        tlm_test_enable_local();
        tlm_test_assert(!tlm_capture_crash("unclassified") && tlm_inventory().local_count==20,"T07 orphan occupancy cannot free imaginary quota after regrant",_results);

        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();
        tlm_test_assert(_f.starts==1 && !is_undefined(global.telemetry.active),"Fake automatic transport starts once",_results);
        var _request=global.telemetry.active.request_id;
        tlm_test_callback(1,0,"",_request);
        tlm_test_assert(!is_undefined(global.telemetry.active) && global.telemetry.records[0].state=="active","T10 progress preserves correlation and body",_results);
        tlm_test_callback(0,403,"{\"status\":\"rejected\"}",_request);
        tlm_test_assert(is_undefined(global.telemetry.active) && global.telemetry.records[0].state=="held_rejected" && array_length(global.telemetry.receipts)==0,"T10 completed HTTP403 is not success",_results);

        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();
        tlm_test_callback(0,500,"Synthetic response must not be logged");
        tlm_test_assert(global.telemetry.records[0].state=="attempted_unknown" && global.telemetry.records[0].next_attempt_at>=_f.now+60,"T10 HTTP500 has bounded backoff and no success",_results);
        var _first_body=_f.requests[0];_f.now+=61;tlm_step();
        tlm_test_assert(_f.starts==2 && _f.requests[1]==_first_body,"Retry preserves exact bytes and report ID",_results);
        var _active=global.telemetry.active;var _ack=tlm_test_ack(_active);tlm_test_callback(0,200,_ack);
        tlm_test_assert(array_length(global.telemetry.records)==0 && global.telemetry.receipts[0].state=="acknowledged","T12 valid matching ACK removes only pending body",_results);
        tlm_test_assert(!tlm_test_callback(0,200,_ack,_active.request_id) && array_length(global.telemetry.receipts)==1,"T12 duplicate late callback has no second effect",_results);
        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();
        var _headers=ds_map_create();_headers[? "Retry-After"]="3600";
        var _response=ds_map_create();_response[? "id"]=global.telemetry.active.request_id;_response[? "status"]=0;_response[? "http_status"]=429;_response[? "result"]="";_response[? "response_headers"]=_headers;
        tlm_http(_response);ds_map_destroy(_response);ds_map_destroy(_headers);
        tlm_test_assert(global.telemetry.records[0].next_attempt_at>=_f.now+3600 && global.telemetry.records[0].next_attempt_at<=_f.now+21600,"T10 valid bounded Retry-After honored",_results);

        var _invalid_acks=["", "{\"status\":\"stored\"}","{\"status\":\"rejected\"}",string_repeat("x",4097)];
        for(var _k=0;_k<array_length(_invalid_acks);++_k) {
            _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();tlm_test_callback(0,200,_invalid_acks[_k]);
            tlm_test_assert(array_length(global.telemetry.records)==1 && global.telemetry.records[0].state=="held_rejected" && array_length(global.telemetry.receipts)==0,"T11 invalid ACK variant "+string(_k)+" cannot acknowledge",_results);
        }
        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();_active=global.telemetry.active;
        tlm_test_callback(0,202,tlm_test_ack(_active));
        tlm_test_assert(global.telemetry.records[0].state=="held_rejected","T11 HTTP202 cannot acknowledge",_results);
        var _ack_variants=["wrong_id","wrong_schema","wrong_digest","wrong_type"];
        for(var _av=0;_av<array_length(_ack_variants);++_av) {
            _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();_active=global.telemetry.active;
            var _ack_object={status:"stored",report_id:_active.report_id,schema_version:1,payload_sha256:_active.payload_sha256};
            switch(_ack_variants[_av]) {
                case "wrong_id": _ack_object.report_id="ffffffffffffffffffffffffffffffff";break;
                case "wrong_schema": _ack_object.schema_version=2;break;
                case "wrong_digest": _ack_object.payload_sha256=string_repeat("f",64);break;
                case "wrong_type": _ack_object.schema_version=true;break;
            }
            tlm_test_callback(0,200,json_stringify(_ack_object));
            tlm_test_assert(array_length(global.telemetry.records)==1 && global.telemetry.records[0].state=="held_rejected" && array_length(global.telemetry.receipts)==0,"T11 mismatched ACK "+_ack_variants[_av]+" cannot acknowledge",_results);
        }
        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");
        var _bad_pending=tlm_copy(global.telemetry.records[0]);_bad_pending.expires_at=_bad_pending.created_at+8*86400;
        tlm_test_assert(!tlm_validate_record(_bad_pending),"T07 pending metadata cannot extend expiry beyond seven days",_results);
        _bad_pending=tlm_copy(global.telemetry.records[0]);_bad_pending.expires_at=NaN;
        tlm_test_assert(!tlm_validate_record(_bad_pending),"Nonfinite expiry metadata is rejected",_results);
        _bad_pending=tlm_copy(global.telemetry.records[0]);_bad_pending.next_attempt_at=infinity;
        tlm_test_assert(!tlm_validate_record(_bad_pending),"Nonfinite retry timestamp metadata is rejected",_results);
        _f.start_failure=true;tlm_step();
        tlm_test_assert(_f.starts==1 && is_undefined(global.telemetry.active) && global.telemetry.records[0].state=="attempted_unknown" && global.telemetry.records[0].reason=="start_failed" && array_length(global.telemetry.receipts)==0,"T10 request-start failure preserves pending body without acknowledgement",_results);
        _f=tlm_test_new();tlm_test_enable_remote();tlm_apply_choice("context",true);tlm_capture_crash("unclassified",{mode:"editor"});
        global.telemetry.records[0].allowed_fields=[];tlm_step();
        tlm_test_assert(_f.starts==0 && global.telemetry.records[0].state=="held_rejected","T13 capture scope must match actual optional body fields",_results);

        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");_f.fail_remove=true;tlm_apply_choice("enabled",false);tlm_apply_choice("enabled",true);tlm_step();
        tlm_test_assert(_f.starts==0 && global.telemetry.records[0].state=="discarded","T08 withdrawal plus failed deletion never revives report",_results);
        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_apply_choice("enabled",false);tlm_step();
        tlm_test_assert(_f.starts==0,"T09 restriction before serialized dispatch wins",_results);
        _f=tlm_test_new();tlm_test_enable_remote();tlm_capture_crash("unclassified");tlm_step();_active=global.telemetry.active;tlm_apply_choice("enabled",false);tlm_test_callback(0,200,tlm_test_ack(_active),_active.request_id);tlm_step();
        tlm_test_assert(_f.starts==1 && !global.telemetry.choices.enabled && array_length(global.telemetry.receipts)>=1,"T09 late receipt after Off cannot requeue or enable",_results);

        _f=tlm_test_new();tlm_capture_crash("unclassified");
        tlm_test_assert(tlm_manual_begin("","unclassified").ok,"T14 deliberate manual draft works while Off",_results);
        tlm_manual_summary("Synthetic Unicode: café 猫. No personal details.");tlm_manual_approve();
        var _preview=tlm_manual_preview();
        tlm_test_assert(tlm_sha256(_preview.body)==_preview.digest && !global.telemetry.choices.enabled,"T14 exact UTF8 preview digest without future permission",_results);
        tlm_test_assert(tlm_manual_export().ok && _f.starts==0,"T14 reviewed export while Off makes zero requests",_results);
        tlm_manual_approve();global.telemetry.remote_available=true;global.telemetry.destination="Synthetic isolated receiver (memory fixture)";
        tlm_test_assert(!tlm_manual_send().ok,"T14 destination change invalidates prior approval",_results);
        tlm_test_assert(!tlm_manual_approve().ok,"T14 changed recipient cannot be approved before fresh preview",_results);
        _preview=tlm_manual_preview();
        tlm_test_assert(_preview.destination==global.telemetry.destination && !global.telemetry.manual.approved,"T14 fresh preview displays changed recipient without granting permission",_results);
        tlm_manual_approve();_preview=tlm_manual_preview();tlm_manual_send();
        tlm_test_assert(_f.starts==1 && _f.requests[0]==_preview.body,"T14 sent bytes equal reviewed preview exactly",_results);
        _active=global.telemetry.active;tlm_test_callback(0,200,tlm_test_ack(_active));
        tlm_manual_summary("Changed synthetic text.");
        tlm_test_assert(!tlm_manual_authorized(),"T14 editing invalidates approval and report identity",_results);
        tlm_manual_approve();_f.now+=1801;
        tlm_test_assert(!tlm_manual_authorized(),"T14 preview expires after thirty minutes",_results);
        tlm_manual_cancel();tlm_test_assert(is_undefined(global.telemetry.manual),"Manual Cancel discards memory draft",_results);
        _f=tlm_test_new();
        tlm_test_assert(!tlm_manual_from_code("arbitrary exception text").ok,"Manual code route rejects arbitrary text",_results);
        tlm_test_assert(tlm_manual_from_code("unclassified").ok && global.telemetry.last_error_code=="" && !global.telemetry.choices.enabled,"Post-restart deliberate code draft changes no observed error or automatic choice",_results);
        global.telemetry.remote_available=true;global.telemetry.destination="Synthetic isolated receiver (memory fixture)";tlm_manual_preview();tlm_manual_approve();tlm_manual_send();
        tlm_test_callback(0,403,"{\"status\":\"rejected\"}");
        tlm_test_assert(global.telemetry.receipts[0].state=="held_rejected","Known manual HTTP403 is labelled rejected",_results);
        tlm_manual_from_code("unclassified");tlm_manual_approve();tlm_manual_send();_active=global.telemetry.active;tlm_manual_cancel();
        var _first_outcome=global.telemetry.receipts[1].recorded_at;_f.now+=100;tlm_test_callback(0,200,tlm_test_ack(_active),_active.request_id);
        tlm_test_assert(array_length(global.telemetry.receipts)==2 && global.telemetry.receipts[1].state=="acknowledged" && global.telemetry.receipts[1].recorded_at==_first_outcome,"Late manual ACK refines one receipt without renewing expiry",_results);

        _f=tlm_test_new();tlm_test_enable_local();tlm_capture_crash("unclassified");
        var _old_id=global.telemetry.records[0].report_id;tlm_manual_begin(_old_id);var _manual_id=global.telemetry.manual.report.report_id;
        tlm_test_assert(_manual_id!=_old_id,"Manual derivative has a fresh report identity",_results);
        tlm_shutdown();tlm_test_new(_f);
        tlm_test_assert(is_undefined(global.telemetry.manual),"Restart never restores a manual draft",_results);
        tlm_test_assert(tlm_manual_begin(_old_id).ok && global.telemetry.manual.report.report_id!=_manual_id,"T14 retained record after restart needs fresh manual ID",_results);
        tlm_reset_choices();tlm_test_assert(!global.telemetry.choices.enabled && !global.telemetry.choices.keep_local,"T04 data reset turns all destinations Off",_results);

        var _definition=tlm_dictionary();var _keys=[];
        for(var _m=0;_m<array_length(_definition);++_m) array_push(_keys,_definition[_m].key);
        tlm_test_assert(array_length(_definition)==17 && tlm_member("report_id",_keys) && tlm_member("error.code",_keys),"Included Data dictionary covers core and optional units",_results);
    } catch(_unexpected) {
        // A bounded generic failure is enough; never emit a fixture/store/body or
        // an arbitrary exception string from the diagnostics reporter itself.
        array_push(_results,{label:"Unexpected exception in GML test harness",passed:false});
    }
    global.telemetry=_previous;
    var _passed=0;for(var _z=0;_z<array_length(_results);++_z) if(_results[_z].passed) {_passed+=1;}
    show_debug_message("TELEMETRY TESTS "+string(_passed)+"/"+string(array_length(_results)));
    return {passed:_passed,total:array_length(_results),results:_results};
}
