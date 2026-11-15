/// Sticky Paws diagnostic contract v1. One serialized owner; no raw exceptions,
/// globals, paths, content names or legacy INIs enter a report. Network delivery
/// is intentionally unavailable until the matching receiver is verified.
function tlm_result(_ok, _reason) { return {ok:_ok, reason:_reason}; }
function tlm_has(_s, _key) { return is_struct(_s) && variable_struct_exists(_s, _key); }
function tlm_get(_s, _key, _fallback=undefined) {
    return tlm_has(_s,_key) ? variable_struct_get(_s,_key) : _fallback;
}
function tlm_int(_v,_lo,_hi) {
    return is_real(_v) && !is_bool(_v) && !is_nan(_v) && _v >= _lo && _v <= _hi && floor(_v)==_v;
}
function tlm_member(_v,_a) {
    for (var _i=0; _i<array_length(_a); ++_i) if (_a[_i]==_v) return true;
    return false;
}
function tlm_identifier(_v,_max) {
    if (!is_string(_v) || string_length(_v)<1 || string_length(_v)>_max) return false;
    var _chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.-";
    for(var _i=1;_i<=string_length(_v);++_i) if(string_pos(string_char_at(_v,_i),_chars)==0) return false;
    return true;
}
function tlm_hex(_v,_len) {
    if(!is_string(_v) || string_length(_v)!=_len) return false;
    for(var _i=1;_i<=_len;++_i) if(string_pos(string_char_at(_v,_i),"0123456789abcdef")==0) return false;
    return true;
}
function tlm_keys(_s,_allowed,_required=[]) {
    if(!is_struct(_s)) return false;
    var _keys=variable_struct_get_names(_s);
    for(var _i=0;_i<array_length(_keys);++_i) if(!tlm_member(_keys[_i],_allowed)) return false;
    for(var _j=0;_j<array_length(_required);++_j) if(!tlm_has(_s,_required[_j])) return false;
    return true;
}

// Native JSON accepts some extensions and duplicate names. This bounded lexical
// pass rejects trailing commas, duplicate decoded names, depth overflow, control
// characters and non-JSON scalars before json_parse(...,undefined,true).
function tlm_json_space(_p) {
    while(_p.pos<=_p.len && string_pos(string_char_at(_p.text,_p.pos)," \t\r\n")>0) {_p.pos+=1;}
}
function tlm_json_string(_p) {
    if(string_char_at(_p.text,_p.pos)!="\"") { _p.ok=false; return ""; }
    var _start=_p.pos; ++_p.pos;
    var _closed=false;
    while(_p.pos<=_p.len) {
        var _c=string_char_at(_p.text,_p.pos++);
        if(_c=="\"") { _closed=true; break; }
        if(ord(_c)<32) { _p.ok=false; break; }
        if(_c=="\\") {
            if(_p.pos>_p.len) { _p.ok=false; break; }
            var _e=string_char_at(_p.text,_p.pos++);
            if(_e=="u") {
                for(var _h=0;_h<4;++_h) {
                    if(_p.pos>_p.len || string_pos(string_char_at(_p.text,_p.pos++),"0123456789abcdefABCDEF")==0) _p.ok=false;
                }
            } else if(string_pos(_e,"\"\\/bfnrt")==0) _p.ok=false;
        }
        if(!_p.ok) break;
    }
    if(!_closed) _p.ok=false;
    if(!_p.ok) return "";
    try { return json_parse("{\"key\":"+string_copy(_p.text,_start,_p.pos-_start)+"}",undefined,true).key; }
    catch(_ignored) { _p.ok=false; return ""; }
}
function tlm_json_value(_p,_depth) {
    tlm_json_space(_p);
    if(!_p.ok || _p.pos>_p.len) { _p.ok=false; return; }
    var _c=string_char_at(_p.text,_p.pos);
    if(_c=="{" || _c=="[") {
        if(_depth>_p.maxdepth) { _p.ok=false; return; }
        var _object=(_c=="{"); var _end=_object ? "}" : "]";
        ++_p.pos; tlm_json_space(_p); var _names={};
        if(string_char_at(_p.text,_p.pos)==_end) {++_p.pos;return;}
        while(_p.ok && _p.pos<=_p.len) {
            if(_object) {
                var _key=tlm_json_string(_p);
                if(!_p.ok || variable_struct_exists(_names,_key)) {_p.ok=false;return;}
                variable_struct_set(_names,_key,true); tlm_json_space(_p);
                if(string_char_at(_p.text,_p.pos++)!=":") {_p.ok=false;return;}
            }
            tlm_json_value(_p,_depth+1); tlm_json_space(_p);
            var _delimiter=string_char_at(_p.text,_p.pos++);
            if(_delimiter==_end) return;
            if(_delimiter!=",") {_p.ok=false;return;}
            tlm_json_space(_p);
            if(string_char_at(_p.text,_p.pos)==_end) {_p.ok=false;return;}
        }
        _p.ok=false; return;
    }
    if(_c=="\"") {tlm_json_string(_p);return;}
    var _start=_p.pos;
    while(_p.pos<=_p.len && string_pos(string_char_at(_p.text,_p.pos),",]} \t\r\n")==0) {_p.pos+=1;}
    var _scalar=string_copy(_p.text,_start,_p.pos-_start);
    if(tlm_member(_scalar,["true","false","null"])) return;
    // JSON number grammar, without coercing quoted GameMaker reference values.
    var _q=1; var _n=string_length(_scalar);
    if(string_char_at(_scalar,_q)=="-") {_q+=1;}
    if(string_char_at(_scalar,_q)=="0") {_q+=1;}
    else {
        if(string_pos(string_char_at(_scalar,_q),"123456789")==0 || _q>_n) {_p.ok=false;return;}
        while(_q<=_n && string_pos(string_char_at(_scalar,_q),"0123456789")>0) {_q+=1;}
    }
    if(string_char_at(_scalar,_q)==".") {
        ++_q; var _digits=_q;
        while(_q<=_n && string_pos(string_char_at(_scalar,_q),"0123456789")>0) {_q+=1;}
        if(_q==_digits) _p.ok=false;
    }
    if(string_char_at(_scalar,_q)=="e" || string_char_at(_scalar,_q)=="E") {
        ++_q;
        if(string_char_at(_scalar,_q)=="+" || string_char_at(_scalar,_q)=="-") {_q+=1;}
        var _digits2=_q;
        while(_q<=_n && string_pos(string_char_at(_scalar,_q),"0123456789")>0) {_q+=1;}
        if(_q==_digits2) _p.ok=false;
    }
    if(_q!=_n+1 || _n==0) _p.ok=false;
}
function tlm_json_parse(_text,_limit=65536,_depth=4) {
    if(!is_string(_text) || string_byte_length(_text)<1 || string_byte_length(_text)>_limit) return undefined;
    var _p={text:_text,pos:1,len:string_length(_text),maxdepth:_depth,ok:true};
    tlm_json_value(_p,0); tlm_json_space(_p);
    if(!_p.ok || _p.pos<=_p.len) return undefined;
    try {return json_parse(_text,undefined,true);} catch(_ignored) {return undefined;}
}
function tlm_copy(_s) {return tlm_json_parse(json_stringify(_s),131072,8);}

function tlm_field_ids() {
    return ["error.frames","environment.os_release","environment.renderer","environment.gpu_vendor",
        "context.mode","context.content_origin","context.room_id","performance.fps_mean","performance.process_memory_mib"];
}
function tlm_default_choices() {
    var _fields={},_refusals={}; var _ids=tlm_field_ids();
    for(var _i=0;_i<array_length(_ids);++_i) {variable_struct_set(_fields,_ids[_i],false);variable_struct_set(_refusals,_ids[_i],false);}
    return {schema:1,enabled:false,auto_crash:false,keep_local:false,device:false,context:false,performance:false,
        fields:_fields,refusals:_refusals,notice_version:"sticky-diagnostics-1",generation:0};
}
function tlm_validate_choices(_c) {
    if(!tlm_keys(_c,["schema","enabled","auto_crash","keep_local","device","context","performance","fields","refusals","notice_version","generation"],
        ["schema","enabled","auto_crash","keep_local","device","context","performance","fields","refusals","notice_version","generation"])) return false;
    if(!tlm_int(_c.schema,1,1) || !tlm_int(_c.generation,0,2147483646) || _c.notice_version!="sticky-diagnostics-1") return false;
    var _booleans=["enabled","auto_crash","keep_local","device","context","performance"];
    for(var _i=0;_i<array_length(_booleans);++_i) if(!is_bool(variable_struct_get(_c,_booleans[_i]))) return false;
    var _ids=tlm_field_ids();
    if(!tlm_keys(_c.fields,_ids,_ids) || !tlm_keys(_c.refusals,_ids,_ids)) return false;
    for(var _j=0;_j<array_length(_ids);++_j) if(!is_bool(variable_struct_get(_c.fields,_ids[_j])) || !is_bool(variable_struct_get(_c.refusals,_ids[_j]))) return false;
    return true;
}
function tlm_error_codes() {return ["unclassified","level_load","save_failure","resource_unavailable"];}
function tlm_validate_frame(_frame) {
    if(!tlm_keys(_frame,["resource","event","line"],["resource"]) || !tlm_identifier(_frame.resource,64)) return false;
    if(tlm_has(_frame,"event") && !tlm_identifier(_frame.event,32)) return false;
    if(tlm_has(_frame,"line") && !tlm_int(_frame.line,1,1000000)) return false;
    try {return tlm_authored_frame(_frame.resource,tlm_get(_frame,"event",undefined),tlm_get(_frame,"line",undefined));}
    catch(_ignored) {return false;}
}
function tlm_validate_report(_r,_outgoing=true) {
    var _base=["schema_version","kind","report_id","game_build","platform","notice_version","error"];
    var _allowed=["schema_version","kind","report_id","game_build","platform","notice_version","submission_mode","error","environment","context","performance","manual"];
    if(!tlm_keys(_r,_allowed,_base)) return false;
    if(!tlm_int(_r.schema_version,1,1) || _r.kind!="crash" || !tlm_hex(_r.report_id,32)
        || !tlm_identifier(_r.game_build,64) || _r.game_build!=global.telemetry.build
        || _r.platform!="windows" || _r.notice_version!="sticky-diagnostics-1") return false;
    if(_outgoing) {
        if(!tlm_has(_r,"submission_mode") || !tlm_member(_r.submission_mode,["automatic","manual"])) return false;
    } else if(tlm_has(_r,"submission_mode")) return false;
    if(!tlm_keys(_r.error,["code","frames"],["code"]) || !is_string(_r.error.code) || !tlm_member(_r.error.code,tlm_error_codes())) return false;
    if(tlm_has(_r.error,"frames")) {
        if(!global.telemetry.frames_supported || !is_array(_r.error.frames) || array_length(_r.error.frames)<1 || array_length(_r.error.frames)>16) return false;
        for(var _fi=0;_fi<array_length(_r.error.frames);++_fi) if(!tlm_validate_frame(_r.error.frames[_fi])) return false;
    }
    if(tlm_has(_r,"environment")) {
        var _e=_r.environment;
        if(!tlm_keys(_e,["os_release","renderer","gpu_vendor"]) || array_length(variable_struct_get_names(_e))==0) return false;
        if(tlm_has(_e,"os_release") && !tlm_member(_e.os_release,["windows_10","windows_11"])) return false;
        if(tlm_has(_e,"renderer") && !tlm_member(_e.renderer,["d3d11","opengl","vulkan"])) return false;
        if(tlm_has(_e,"gpu_vendor") && !tlm_member(_e.gpu_vendor,["amd","intel","nvidia","other"])) return false;
    }
    if(tlm_has(_r,"context")) {
        var _c=_r.context;
        if(!tlm_keys(_c,["mode","content_origin"]) || array_length(variable_struct_get_names(_c))==0) return false;
        if(tlm_has(_c,"mode") && !tlm_member(_c.mode,["menu","play","editor"])) return false;
        if(tlm_has(_c,"content_origin") && !tlm_member(_c.content_origin,["official","custom","none"])) return false;
    }
    if(tlm_has(_r,"performance")) {
        var _p=_r.performance;
        if(!tlm_keys(_p,["fps_mean","frame_sample_count","process_memory_mib"]) || array_length(variable_struct_get_names(_p))==0) return false;
        if(tlm_has(_p,"fps_mean")!=tlm_has(_p,"frame_sample_count")) return false;
        if(tlm_has(_p,"fps_mean") && (!tlm_int(_p.fps_mean,0,1000) || !tlm_int(_p.frame_sample_count,1,300))) return false;
        if(tlm_has(_p,"process_memory_mib") && (!tlm_int(_p.process_memory_mib,0,1048576) || _p.process_memory_mib mod 64 != 0)) return false;
    }
    if(tlm_has(_r,"manual")) {
        if(!_outgoing || _r.submission_mode!="manual" || !tlm_keys(_r.manual,["summary"],["summary"])) return false;
        var _text=_r.manual.summary;
        if(!is_string(_text) || string_length(_text)>2000 || string_byte_length(_text)>8192 || string_length(string_trim(_text))==0) return false;
    }
    return string_byte_length(json_stringify(_r))<=65536;
}

// Platform adapters may be replaced only by deliberate development fixtures.
// No adapter failure prints its exception or falls back to an unrestricted log.
function tlm_native_read(_path,_limit) {
    var _buffer=-1;
    try {
        if(!file_exists(_path)) return undefined;
        var _handle=file_bin_open(_path,0);
        if(_handle<0) return undefined;
        var _bytes=file_bin_size(_handle); file_bin_close(_handle);
        if(_bytes<1 || _bytes>_limit) return undefined;
        _buffer=buffer_load(_path);
        if(_buffer<0) return undefined;
        // Reject embedded NUL and append a terminator to bounded UTF-8 bytes.
        for(var _i=0;_i<_bytes;++_i) if(buffer_peek(_buffer,_i,buffer_u8)==0) {buffer_delete(_buffer);return undefined;}
        buffer_resize(_buffer,_bytes+1); buffer_poke(_buffer,_bytes,buffer_u8,0);
        buffer_seek(_buffer,buffer_seek_start,0);
        var _text=buffer_read(_buffer,buffer_string); buffer_delete(_buffer); _buffer=-1;
        if(string_byte_length(_text)!=_bytes) return undefined;
        return _text;
    } catch(_ignored) {if(_buffer>=0) buffer_delete(_buffer);return undefined;}
}
function tlm_native_write(_path,_text) {
    var _file=-1;
    try {
        _file=file_text_open_write(_path);
        if(_file<0) return false;
        file_text_write_string(_file,_text);
        var _closed=file_text_close(_file); _file=-1;
        if(!_closed) return false;
        return tlm_native_read(_path,131072)==_text;
    } catch(_ignored) {if(_file>=0) file_text_close(_file);return false;}
}
function tlm_native_remove(_path) {
    try {if(file_exists(_path)) file_delete(_path);return !file_exists(_path);} catch(_ignored) {return false;}
}
function tlm_managed_name(_name) {
    if(!is_string(_name)) return undefined;
    var _store="",_id="";
    if(string_length(_name)==43 && string_pos("local_",_name)==1) {_store="local";_id=string_copy(_name,7,32);}
    if(string_length(_name)==45 && string_pos("pending_",_name)==1) {_store="pending";_id=string_copy(_name,9,32);}
    if(_store=="" || !tlm_hex(_id,32) || string_copy(_name,string_length(_name)-4,5)!=".json") return undefined;
    return {name:_name,report_id:_id,store:_store};
}
function tlm_native_inventory(_root) {
    var _entries=[];
    try {
        if(!directory_exists(_root)) return _entries;
        var _name=file_find_first(_root+"*.json",fa_archive);
        var _scanned=0;
        while(_name!="") {
            ++_scanned;
            if(_scanned>128) {file_find_close();return undefined;}
            var _managed=tlm_managed_name(_name);
            if(!is_undefined(_managed)) {
                var _handle=file_bin_open(_root+_name,0);
                if(_handle<0) {file_find_close();return undefined;}
                var _bytes=file_bin_size(_handle);file_bin_close(_handle);
                array_push(_entries,{name:_name,bytes:_bytes});
            }
            _name=file_find_next();
        }
        file_find_close();return _entries;
    } catch(_ignored) {file_find_close();return undefined;}
}
function tlm_inventory() {
    var _s=global.telemetry;var _entries=undefined;
    try {_entries=_s.adapters.inventory(_s.root);} catch(_ignored) {}
    if(!is_array(_entries) || array_length(_entries)>128) return undefined;
    var _result={local_count:0,pending_count:0,local_bytes:0,pending_bytes:0,orphans:[]};
    var _seen=[];
    for(var _i=0;_i<array_length(_entries);++_i) {
        var _entry=_entries[_i];
        if(!tlm_keys(_entry,["name","bytes"],["name","bytes"]) || !tlm_int(_entry.bytes,0,2147483647)) return undefined;
        var _managed=tlm_managed_name(_entry.name);
        if(is_undefined(_managed) || tlm_member(_entry.name,_seen)) return undefined;
        array_push(_seen,_entry.name);
        if(_managed.store=="local") {++_result.local_count;_result.local_bytes+=_entry.bytes;}
        else {++_result.pending_count;_result.pending_bytes+=_entry.bytes;}
        var _indexed=false;
        for(var _j=0;_j<array_length(_s.records);++_j) if(tlm_record_path(_s.records[_j])==_entry.name) {_indexed=true;break;}
        if(!_indexed) {_managed.bytes=_entry.bytes;array_push(_result.orphans,_managed);}
    }
    return _result;
}
function tlm_read(_relative,_limit=131072) {
    try {return global.telemetry.adapters.read(global.telemetry.root+_relative,_limit);} catch(_ignored) {return undefined;}
}
function tlm_write(_relative,_text) {
    var _s=global.telemetry;
    if(!is_string(_text) || string_byte_length(_text)>131072) return false;
    try {
        if(!_s.adapters.ensure(_s.root)) return false;
        if(!_s.adapters.write(_s.root+_relative,_text)) return false;
        return _s.adapters.read(_s.root+_relative,131072)==_text;
    } catch(_ignored) {return false;}
}
function tlm_remove(_relative) {
    try {return global.telemetry.adapters.remove(global.telemetry.root+_relative);} catch(_ignored) {return false;}
}
function tlm_now() {try {return global.telemetry.adapters.clock();} catch(_ignored) {return -1;}}
function tlm_secure_id() {
    try {var _id=global.telemetry.adapters.secure_id();return tlm_hex(_id,32) ? _id : "";} catch(_ignored) {return "";}
}
function tlm_sha256(_text) {
    try {var _digest=global.telemetry.adapters.sha256(_text);return tlm_hex(_digest,64) ? _digest : "";} catch(_ignored) {return "";}
}
function tlm_is_ready() {return variable_global_exists("telemetry") && is_struct(global.telemetry);}
function tlm_init(_root="",_build="",_injected=undefined) {
    if(tlm_is_ready()) return;
    var _a={
        read:tlm_native_read,write:tlm_native_write,remove:tlm_native_remove,inventory:tlm_native_inventory,
        ensure:function(_path) {try {if(!directory_exists(_path)) directory_create(_path);return directory_exists(_path);} catch(_ignored) {return false;}},
        clock:function() {return tlm_platform_now();},
        secure_id:function() {return tlm_platform_secure_id();},
        sha256:function(_text) {return tlm_platform_sha256(_text);},
        os_release:function() {return tlm_platform_os_release();},memory_mib:function() {return tlm_platform_memory_mib();},
        start:function(_body) {return -1;},cancel:function(_id) {return false;}
    };
    // Injected functions are accepted by this explicit development API, never
    // loaded from player preferences or JSON.
    if(is_struct(_injected)) {
        var _names=variable_struct_get_names(_a);
        for(var _i=0;_i<array_length(_names);++_i) if(tlm_has(_injected,_names[_i])) variable_struct_set(_a,_names[_i],variable_struct_get(_injected,_names[_i]));
    }
    if(!is_string(_root)) _root="";
    if(string_length(_root)>0 && !tlm_member(string_char_at(_root,string_length(_root)),["/","\\"])) _root+="/";
    global.telemetry={root:_root+"diagnostics_v1/",build:_build,adapters:_a,choices:tlm_default_choices(),records:[],receipts:[],sequence:0,slot:0,
        paused:true,saved:false,status:"Off. Review the data choices before enabling diagnostics.",reason:"",armed:false,index_valid:false,unsupported:false,
        supported:os_type==os_windows && tlm_identifier(_build,64),notice_valid:false,frames_supported:false,remote_available:false,destination:"Unavailable: verified diagnostic receiver is not configured.",
        active:undefined,starts:0,manual:undefined,samples:[],sample_at:0,last_clock:-1,cleanup_at:0,handling:false,last_error_code:"",busy:false};
    var _s=global.telemetry;
    var _notice=undefined;
    try {_notice=_a.read(working_directory+"telemetry_notice.txt",32768);} catch(_ignored) {}
    _s.notice_valid=is_string(_notice) && string_pos("sticky-diagnostics-1\nfields:sticky-diagnostics-fields-1\n",string_replace_all(_notice,"\r\n","\n"))==1;
    try {_s.frames_supported=tlm_authored_frames_ready(_build);} catch(_ignored) {_s.frames_supported=false;}
    var _a0=tlm_json_parse(tlm_read("control_a.json"),131072,8);
    var _b0=tlm_json_parse(tlm_read("control_b.json"),131072,8);
    var _aok=tlm_validate_control(_a0), _bok=tlm_validate_control(_b0);
    var _candidate=undefined;
    // Future envelopes are retained, and downgrades cannot overwrite them.
    if((is_struct(_a0) && tlm_get(_a0,"schema",1)!=1) || (is_struct(_b0) && tlm_get(_b0,"schema",1)!=1)) _s.unsupported=true;
    if(_aok) {_candidate=_a0;_s.slot=0;}
    if(_bok && (!_aok || _b0.sequence>_a0.sequence)) {_candidate=_b0;_s.slot=1;}
    if(!is_undefined(_candidate)) {
        _s.choices=_candidate.choices;_s.records=_candidate.records;_s.receipts=_candidate.receipts;_s.sequence=_candidate.sequence;_s.saved=true;
    }
    var _guard=tlm_json_parse(tlm_read("guard.json",1024),1024,1);
    var _clean=tlm_keys(_guard,["schema","armed","sequence"],["schema","armed","sequence"]) && tlm_int(_guard.schema,1,1) && is_bool(_guard.armed) && !_guard.armed
        && tlm_int(_guard.sequence,0,2147483646) && _guard.sequence==_s.sequence;
    _s.index_valid=!is_undefined(_candidate) && _clean && !_s.unsupported;
    _s.paused=!_s.index_valid;
    if(!_s.supported || !_s.notice_valid) {_s.paused=true;_s.status="Automatic diagnostics are unavailable: target, trusted build or bundled notice is not verified.";}
    else if(_s.unsupported) {_s.paused=true;_s.status="A newer preference version is present. Diagnostics stay off; existing files are preserved.";}
    else if(!_s.index_valid) {_s.status="Paused. An interrupted session or unverified preferences require a fresh choice. Earlier reports are manual-only.";}
    else if(_s.choices.enabled && (_s.choices.keep_local || _s.choices.auto_crash)) {
        if(tlm_arm()) {_s.paused=false;_s.status="Saved choices loaded.";} else {_s.paused=true;_s.status="Paused: the session guard could not be verified.";}
    } else {_s.paused=false;_s.status="Off. No automatic diagnostic records or requests.";}
}

function tlm_validate_record(_r) {
    var _keys=["report_id","store","state","created_at","expires_at","generation","notice_version","allowed_fields","bytes","payload_sha256","attempt_count","next_attempt_at","reason"];
    if(!tlm_keys(_r,_keys,_keys)) return false;
    if(!tlm_hex(_r.report_id,32) || !tlm_member(_r.store,["local","pending"]) || !tlm_member(_r.state,["local_only","pending","active","attempted_unknown","held_rejected","expired","discarded"])) return false;
    if(!tlm_int(_r.generation,0,2147483646) || !tlm_int(_r.bytes,1,65536) || !tlm_hex(_r.payload_sha256,64) || !tlm_int(_r.attempt_count,0,5)) return false;
    if(!is_real(_r.created_at) || is_bool(_r.created_at) || is_nan(_r.created_at) || _r.created_at<1 || _r.created_at>1000000000000000) return false;
    var _max_age=(_r.store=="pending" ? 7 : 14)*86400;
    if(!is_real(_r.expires_at) || is_bool(_r.expires_at) || is_nan(_r.expires_at) || _r.expires_at<=_r.created_at || _r.expires_at>_r.created_at+_max_age) return false;
    if(!is_real(_r.next_attempt_at) || is_bool(_r.next_attempt_at) || is_nan(_r.next_attempt_at) || _r.next_attempt_at<0 || _r.next_attempt_at>1000000000000000 || _r.notice_version!="sticky-diagnostics-1") return false;
    if(!is_array(_r.allowed_fields) || array_length(_r.allowed_fields)>9 || !tlm_member(_r.reason,tlm_reasons())) return false;
    var _seen=[];
    for(var _i=0;_i<array_length(_r.allowed_fields);++_i) {
        if(!tlm_member(_r.allowed_fields[_i],tlm_field_ids()) || tlm_member(_r.allowed_fields[_i],_seen)) return false;
        array_push(_seen,_r.allowed_fields[_i]);
    }
    return true;
}
function tlm_reasons() {return ["none","withdrawn","expired","capacity","cleanup_failed","storage_failed","clock_uncertain","transport_failed","start_failed","timeout","ack_invalid","http_rejected","attempt_limit","receiver_unavailable","acknowledged","user_deleted","recovered","body_invalid"];}
function tlm_validate_receipt(_r) {
    return tlm_keys(_r,["report_id","payload_sha256","state","recorded_at","reason"],["report_id","payload_sha256","state","recorded_at","reason"])
        && tlm_hex(_r.report_id,32) && tlm_hex(_r.payload_sha256,64)
        && tlm_member(_r.state,["attempted_unknown","acknowledged","held_rejected","expired","discarded"])
        && is_real(_r.recorded_at) && !is_bool(_r.recorded_at) && _r.recorded_at>0 && _r.recorded_at<1000000000000000
        && tlm_member(_r.reason,tlm_reasons());
}
function tlm_validate_control(_e) {
    if(!tlm_keys(_e,["schema","sequence","choices","records","receipts"],["schema","sequence","choices","records","receipts"])) return false;
    if(!tlm_int(_e.schema,1,1) || !tlm_int(_e.sequence,0,2147483646) || !tlm_validate_choices(_e.choices)
        || !is_array(_e.records) || array_length(_e.records)>30 || !is_array(_e.receipts) || array_length(_e.receipts)>50) return false;
    var _ids=[];var _lcount=0,_qcount=0,_lbytes=0,_qbytes=0;
    for(var _i=0;_i<array_length(_e.records);++_i) {
        var _r=_e.records[_i];
        if(!tlm_validate_record(_r) || tlm_member(_r.report_id,_ids)) return false;
        array_push(_ids,_r.report_id);
        if(_r.store=="local") {++_lcount;_lbytes+=_r.bytes;} else {++_qcount;_qbytes+=_r.bytes;}
    }
    if(_lcount>20 || _qcount>10 || _lbytes>5242880 || _qbytes>655360) return false;
    for(var _j=0;_j<array_length(_e.receipts);++_j) if(!tlm_validate_receipt(_e.receipts[_j])) return false;
    return string_byte_length(json_stringify(_e.receipts))<=65536;
}
function tlm_persist() {
    var _s=global.telemetry;
    if(_s.unsupported || _s.sequence>=2147483646) {_s.saved=false;return false;}
    var _envelope={schema:1,sequence:_s.sequence+1,choices:_s.choices,records:_s.records,receipts:_s.receipts};
    if(!tlm_validate_control(_envelope)) {_s.saved=false;return false;}
    var _body=json_stringify(_envelope);
    var _next=1-_s.slot;var _path=_next==0 ? "control_a.json" : "control_b.json";
    if(!tlm_write(_path,_body)) {_s.saved=false;return false;}
    var _readtext=tlm_read(_path);var _read=tlm_json_parse(_readtext,131072,8);
    if(_readtext!=_body || !tlm_validate_control(_read)) {_s.saved=false;return false;}
    _s.sequence=_envelope.sequence;_s.slot=_next;_s.saved=true;return true;
}
function tlm_arm() {
    var _s=global.telemetry;
    if(_s.armed) return true;
    if(!tlm_write("guard.json",json_stringify({schema:1,armed:true,sequence:_s.sequence}))) return false;
    _s.armed=true;return true;
}
function tlm_field_allowed(_key) {
    var _s=global.telemetry,_c=_s.choices;
    if(!_c.enabled || _s.paused || !_s.saved || !_s.armed || !(_c.keep_local || (_c.auto_crash && _s.remote_available))) return false;
    if(!tlm_get(_c.fields,_key,false)) return false;
    if(string_pos("environment.",_key)==1) return _c.device;
    if(string_pos("context.",_key)==1) return _c.context;
    if(string_pos("performance.",_key)==1) return _c.performance;
    return _key=="error.frames";
}
function tlm_capture_allowed() {
    var _s=global.telemetry;
    return _s.supported && _s.notice_valid && !_s.paused && _s.saved && _s.armed && _s.index_valid && _s.choices.enabled
        && (_s.choices.keep_local || (_s.choices.auto_crash && _s.remote_available));
}
function tlm_invalidate_manual() {
    if(!is_undefined(global.telemetry.manual)) {global.telemetry.manual.approved=false;global.telemetry.manual.status="Review changed. Preview and approve again.";}
}
function tlm_restrict(_reason="withdrawn") {
    var _s=global.telemetry;
    _s.samples=[];tlm_invalidate_manual();
    if(_s.choices.generation>=2147483646) {_s.paused=true;return;}
    ++_s.choices.generation;
    for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].store=="pending") {_s.records[_i].state="discarded";_s.records[_i].reason=_reason;}
    if(!is_undefined(_s.active)) {
        try {_s.adapters.cancel(_s.active.request_id);} catch(_ignored) {}
        _s.active.withdrawn=true;
        _s.status="New reports and retries stopped. An already dispatched report may have reached the server.";
    }
}
function tlm_apply_choice(_key,_value) {
    if(!tlm_is_ready() || !is_bool(_value)) return tlm_result(false,"Invalid choice.");
    var _s=global.telemetry;
    if(_s.unsupported) return tlm_result(false,"A newer preference version is preserved. This version cannot replace it.");
    var _simple=["enabled","auto_crash","keep_local","device","context","performance"];
    var _field=tlm_member(_key,tlm_field_ids());
    if(!tlm_member(_key,_simple) && !_field) return tlm_result(false,"Unknown choice.");
    if(_key=="auto_crash" && _value && !_s.remote_available) return tlm_result(false,_s.destination);
    if(_value && (!_s.supported || !_s.notice_valid)) return tlm_result(false,"The diagnostic adapter or matching bundled notice is unavailable.");
    var _before=tlm_copy(_s.choices);
    var _old=_field ? tlm_get(_s.choices.fields,_key,false) : variable_struct_get(_s.choices,_key);
    if(_field) {variable_struct_set(_s.choices.fields,_key,_value);variable_struct_set(_s.choices.refusals,_key,!_value);}else variable_struct_set(_s.choices,_key,_value);
    var _restriction=(_old && !_value);
    if(_restriction) tlm_restrict(); else tlm_invalidate_manual();
    // Recovery starts a fresh enrollment index; prior bodies never become
    // eligible even if deletion fails. They remain explicitly manual-only.
    if(!_s.index_valid) {
        for(var _j=0;_j<array_length(_s.records);++_j) if(_s.records[_j].store=="pending") {_s.records[_j].state="discarded";_s.records[_j].reason="recovered";}
        if(!tlm_persist()) {
            if(!_restriction) _s.choices=_before;
            _s.paused=true;_s.saved=false;_s.status="Choices not saved. Diagnostics remain paused. Retry the choice.";
            return tlm_result(false,_s.status);
        }
        _s.index_valid=true;
    }
    // A new destination selects the known basic field group; explicit advanced
    // refusals are not overwritten by category changes.
    if(_value && tlm_member(_key,["device","context","performance"]) && !_old) {
        var _prefix=_key=="device" ? "environment." : _key+".";
        if(_key=="performance") _prefix="performance.";
        var _ids=tlm_field_ids();
        for(var _k=0;_k<array_length(_ids);++_k) if(string_pos(_prefix,_ids[_k])==1 && !tlm_get(_s.choices.refusals,_ids[_k],false)) variable_struct_set(_s.choices.fields,_ids[_k],true);
    }
    if(_value && tlm_member(_key,["keep_local","auto_crash"]) && !_old && !tlm_get(_s.choices.refusals,"error.frames",false)) variable_struct_set(_s.choices.fields,"error.frames",true);
    if(!tlm_persist()) {
        if(!_restriction) _s.choices=_before;
        _s.paused=true;_s.saved=false;_s.status="Choices not saved. Restrictions apply now; automatic work stays paused. Retry to save.";
        return tlm_result(false,_s.status);
    }
    _s.paused=false;
    if(_s.choices.enabled && (_s.choices.keep_local || (_s.choices.auto_crash && _s.remote_available))) {
        if(!tlm_arm()) {_s.paused=true;_s.status="Choices saved, but the session guard failed. No collection has started.";return tlm_result(false,_s.status);}
    }
    _s.status=_s.choices.enabled ? "Saved. Collection requires a selected destination and available fields." : "Saved. Off: no automatic diagnostic records or requests.";
    tlm_cleanup();return tlm_result(true,_s.status);
}
function tlm_reset_choices() {
    var _s=global.telemetry;var _generation=_s.choices.generation;
    _s.choices=tlm_default_choices();_s.choices.generation=_generation;tlm_restrict();
    if(!tlm_persist()) {_s.paused=true;_s.status="Off now. Reset could not be saved; restart will require review.";return tlm_result(false,_s.status);}
    _s.status="Saved. All data choices are off.";tlm_cleanup();return tlm_result(true,_s.status);
}

function tlm_record_path(_r) {return _r.store+"_"+_r.report_id+".json";}
function tlm_receipt(_r,_state,_reason) {
    var _s=global.telemetry;var _now=tlm_now();
    if(_now<=0) return;
    for(var _i=0;_i<array_length(_s.receipts);++_i) if(_s.receipts[_i].report_id==_r.report_id) {
        // Refine an uncertain result without renewing its first outcome time.
        // A late non-acknowledgement cannot downgrade a verified stored receipt.
        if(_s.receipts[_i].state=="acknowledged") return;
        _s.receipts[_i].state=_state;_s.receipts[_i].reason=_reason;return;
    }
    while(array_length(_s.receipts)>=50) array_delete(_s.receipts,0,1);
    array_push(_s.receipts,{report_id:_r.report_id,payload_sha256:_r.payload_sha256,state:_state,recorded_at:_now,reason:_reason});
    while(string_byte_length(json_stringify(_s.receipts))>65536 && array_length(_s.receipts)>0) array_delete(_s.receipts,0,1);
}
function tlm_cleanup() {
    var _s=global.telemetry,_now=tlm_now();var _changed=false;
    if(_now<=0) return;
    for(var _i=array_length(_s.records)-1;_i>=0;--_i) {
        var _r=_s.records[_i];
        if(_now<_r.created_at) {if(_r.state=="pending") {_r.state="held_rejected";_r.reason="clock_uncertain";_changed=true;}continue;}
        if(_now>=_r.expires_at && !tlm_member(_r.state,["expired","discarded"])) {_r.state="expired";_r.reason="expired";_changed=true;}
        if(tlm_member(_r.state,["expired","discarded"])) {
            if(tlm_remove(tlm_record_path(_r))) {
                tlm_receipt(_r,_r.state,_r.reason);array_delete(_s.records,_i,1);_changed=true;
            } else {_r.reason="cleanup_failed";_s.status="Some local files could not be removed. They remain ineligible for sending.";_changed=true;}
        }
    }
    for(var _j=array_length(_s.receipts)-1;_j>=0;--_j) if(_now>=_s.receipts[_j].recorded_at+30*86400) {array_delete(_s.receipts,_j,1);_changed=true;}
    if(_changed && !tlm_persist()) {_s.paused=true;_s.status="Cleanup state could not be saved. Automatic work is paused.";}
}
function tlm_make_room(_store,_bytes) {
    var _s=global.telemetry;tlm_cleanup();
    var _max=_store=="local" ? 20 : 10, _cap=_store=="local" ? 5242880 : 655360;
    for(var _tries=0;_tries<30;++_tries) {
        // Inspect managed names and file sizes only. Orphans consume quota but
        // are never parsed, trusted or enrolled by this inventory operation.
        var _disk=tlm_inventory();
        if(is_undefined(_disk)) {_s.paused=true;_s.status="Paused: local diagnostic occupancy could not be verified.";return false;}
        var _count=0,_total=0,_oldest=-1,_oldtime=1000000000000001;
        for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].store==_store) {
            ++_count;_total+=_s.records[_i].bytes;
            if(_s.records[_i].created_at<_oldtime) {_oldtime=_s.records[_i].created_at;_oldest=_i;}
        }
        var _diskcount=_store=="local" ? _disk.local_count : _disk.pending_count;
        var _diskbytes=_store=="local" ? _disk.local_bytes : _disk.pending_bytes;
        if(max(_count,_diskcount)<_max && max(_total,_diskbytes)+_bytes<=_cap) return true;
        if(_oldest<0) {_s.status="Unindexed local files occupy the diagnostic limit. Review or delete those local files before creating more.";return false;}
        var _r=_s.records[_oldest];_r.state="expired";_r.reason="capacity";
        if(!tlm_remove(tlm_record_path(_r))) {_r.reason="cleanup_failed";tlm_persist();return false;}
        tlm_receipt(_r,"expired","capacity");array_delete(_s.records,_oldest,1);
        if(!tlm_persist()) {_s.paused=true;return false;}
    }
    return false;
}
function tlm_store_report(_report,_store,_allowed) {
    var _s=global.telemetry;var _outgoing=(_store=="pending");
    if(!tlm_validate_report(_report,_outgoing) || !tlm_scope_matches(_report,_allowed)) return false;
    for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].report_id==_report.report_id) return false;
    var _inventory=tlm_inventory();
    if(is_undefined(_inventory)) return false;
    for(var _j=0;_j<array_length(_inventory.orphans);++_j) if(_inventory.orphans[_j].report_id==_report.report_id) return false;
    var _body=json_stringify(_report),_digest=tlm_sha256(_body),_now=tlm_now();
    if(_digest=="" || _now<=0 || !tlm_make_room(_store,string_byte_length(_body))) return false;
    var _r={report_id:_report.report_id,store:_store,state:_outgoing ? "pending" : "local_only",created_at:_now,
        expires_at:_now+(_outgoing ? 7 : 14)*86400,generation:_s.choices.generation,notice_version:"sticky-diagnostics-1",allowed_fields:_allowed,
        bytes:string_byte_length(_body),payload_sha256:_digest,attempt_count:0,next_attempt_at:0,reason:"none"};
    // Commit body first, enrollment second. A failed index save leaves an orphan,
    // which is never discovered as automatic eligibility by a directory scan.
    if(!tlm_write(tlm_record_path(_r),_body)) return false;
    array_push(_s.records,_r);
    if(!tlm_persist()) {
        _r.state="discarded";_r.reason="storage_failed";
        if(tlm_remove(tlm_record_path(_r))) array_pop(_s.records);
        else {_r.reason="cleanup_failed";_s.status="A diagnostic write could not be committed or removed. It remains ineligible and occupies local quota.";}
        _s.paused=true;return false;
    }
    return true;
}
function tlm_core_report(_code) {
    var _s=global.telemetry;var _id=tlm_secure_id();
    if(!_s.supported || !_s.notice_valid || _id=="" || !tlm_member(_code,tlm_error_codes())) return undefined;
    return {schema_version:1,kind:"crash",report_id:_id,game_build:_s.build,platform:"windows",notice_version:"sticky-diagnostics-1",error:{code:_code}};
}
function tlm_report_fields(_r) {
    var _fields=[];
    if(tlm_has(_r.error,"frames")) array_push(_fields,"error.frames");
    var _containers=["environment","context","performance"];
    for(var _i=0;_i<array_length(_containers);++_i) if(tlm_has(_r,_containers[_i])) {
        var _keys=variable_struct_get_names(variable_struct_get(_r,_containers[_i]));
        for(var _j=0;_j<array_length(_keys);++_j) if(_keys[_j]!="frame_sample_count") array_push(_fields,_containers[_i]+"."+_keys[_j]);
    }
    return _fields;
}
function tlm_scope_matches(_r,_fields) {
    if(!is_array(_fields)) return false;
    var _actual=tlm_report_fields(_r);
    if(array_length(_actual)!=array_length(_fields)) return false;
    for(var _i=0;_i<array_length(_actual);++_i) if(!tlm_member(_actual[_i],_fields)) return false;
    return true;
}
function tlm_capture_crash(_code="unclassified",_context=undefined,_frames=undefined) {
    if(!tlm_is_ready()) return false;
    var _s=global.telemetry;
    if(!is_string(_code) || !tlm_member(_code,tlm_error_codes())) _code="unclassified";
    _s.last_error_code=_code; // bounded in-memory help also works while Off.
    if(_s.handling || !tlm_capture_allowed()) return false;
    _s.handling=true;var _ok=false;
    try {
        var _r=tlm_core_report(_code);var _allowed=[];
        if(!is_undefined(_r)) {
            if(tlm_field_allowed("error.frames") && _s.frames_supported && is_array(_frames) && array_length(_frames)<=16) {
                var _safe_frames=[];
                for(var _fr=0;_fr<array_length(_frames);++_fr) if(tlm_validate_frame(_frames[_fr])) {
                    var _frame={resource:_frames[_fr].resource};
                    if(tlm_has(_frames[_fr],"event")) _frame.event=_frames[_fr].event;
                    if(tlm_has(_frames[_fr],"line")) _frame.line=_frames[_fr].line;
                    array_push(_safe_frames,_frame);
                }
                if(array_length(_safe_frames)>0) {_r.error.frames=_safe_frames;array_push(_allowed,"error.frames");}
            }
            if(tlm_field_allowed("environment.os_release")) {
                var _os=undefined;try {_os=_s.adapters.os_release();} catch(_ignored) {}
                if(tlm_member(_os,["windows_10","windows_11"])) {_r.environment={os_release:_os};array_push(_allowed,"environment.os_release");}
            }
            if(tlm_keys(_context,["mode","content_origin"])) {
                var _c={};
                if(tlm_field_allowed("context.mode") && tlm_has(_context,"mode") && tlm_member(_context.mode,["menu","play","editor"])) { _c.mode=_context.mode;array_push(_allowed,"context.mode");}
                if(tlm_field_allowed("context.content_origin") && tlm_has(_context,"content_origin") && tlm_member(_context.content_origin,["official","custom","none"])) {_c.content_origin=_context.content_origin;array_push(_allowed,"context.content_origin");}
                if(array_length(variable_struct_get_names(_c))>0) _r.context=_c;
            }
            if(tlm_field_allowed("performance.fps_mean") && array_length(_s.samples)>0) {
                var _sum=0;for(var _j=0;_j<array_length(_s.samples);++_j) _sum+=_s.samples[_j].value;
                _r.performance={fps_mean:round(_sum/array_length(_s.samples)),frame_sample_count:array_length(_s.samples)};
                array_push(_allowed,"performance.fps_mean");
            }
            if(tlm_field_allowed("performance.process_memory_mib")) {
                var _memory=-1;try {_memory=_s.adapters.memory_mib();} catch(_ignored) {}
                if(tlm_int(_memory,0,1048576) && _memory mod 64==0) {
                    if(!tlm_has(_r,"performance")) _r.performance={};
                    _r.performance.process_memory_mib=_memory;array_push(_allowed,"performance.process_memory_mib");
                }
            }
            if(_s.choices.keep_local) _ok=tlm_store_report(_r,"local",_allowed);
            if(_s.choices.auto_crash && _s.remote_available && tlm_capture_allowed()) {
                var _auto=tlm_copy(_r);_auto.report_id=tlm_secure_id();_auto.submission_mode="automatic";
                if(tlm_hex(_auto.report_id,32)) _ok=tlm_store_report(_auto,"pending",_allowed) || _ok;
            }
        }
    } catch(_ignored) {_s.status="The diagnostic record could not be prepared. No fallback dump was created.";}
    _s.handling=false;return _ok;
}

function tlm_dispatch_eligible(_r) {
    var _s=global.telemetry;var _now=tlm_now();
    if(!_s.remote_available || !tlm_capture_allowed() || !_s.choices.auto_crash || !_s.index_valid || _r.store!="pending" || _r.generation!=_s.choices.generation || _r.notice_version!=_s.choices.notice_version
        || !tlm_member(_r.state,["pending","attempted_unknown"]) || _now<_r.created_at || _now>=_r.expires_at || _r.attempt_count>=5 || _now<_r.next_attempt_at) return false;
    for(var _i=0;_i<array_length(_r.allowed_fields);++_i) if(!tlm_field_allowed(_r.allowed_fields[_i])) return false;
    return true;
}
function tlm_dispatch(_r) {
    var _s=global.telemetry;
    if(!is_undefined(_s.active) || _s.starts>=3 || !tlm_dispatch_eligible(_r)) return false;
    var _body=tlm_read(tlm_record_path(_r),65536),_parsed=tlm_json_parse(_body);
    if(!tlm_validate_report(_parsed,true) || _parsed.report_id!=_r.report_id || _parsed.submission_mode!="automatic" || tlm_sha256(_body)!=_r.payload_sha256
        || string_byte_length(_body)!=_r.bytes || !tlm_scope_matches(_parsed,_r.allowed_fields)) {_r.state="held_rejected";_r.reason="body_invalid";tlm_persist();return false;}
    // Persist the attempt before starting it. No Draw event can interleave a
    // restriction between the final check and request creation in this owner.
    ++_r.attempt_count;_r.state="active";
    if(!tlm_persist()) {_r.state="attempted_unknown";_s.paused=true;return false;}
    ++_s.starts;
    var _id=-1;try {_id=_s.adapters.start(_body);} catch(_ignored) {}
    if(!is_real(_id) || _id<0) {tlm_attempt_failure(_r,"start_failed",true);return false;}
    _s.active={request_id:_id,report_id:_r.report_id,payload_sha256:_r.payload_sha256,manual:false,started_at:tlm_now(),withdrawn:false};
    return true;
}
function tlm_attempt_failure(_r,_reason,_retry,_retry_after=0) {
    var _s=global.telemetry;
    _r.state=_retry && _r.attempt_count<5 ? "attempted_unknown" : "held_rejected";
    _r.reason=_r.attempt_count>=5 ? "attempt_limit" : _reason;
    var _delays=[60,300,1800,21600];
    var _delay=_delays[clamp(_r.attempt_count-1,0,3)];
    // A deterministic per-report fraction spreads retries without collecting a
    // new identifier or using a weak random fallback for report IDs.
    var _tail=string_copy(_r.report_id,31,2);var _fraction=(string_pos(string_char_at(_tail,1),"0123456789abcdef")-1)*16+string_pos(string_char_at(_tail,2),"0123456789abcdef")-1;
    _delay+=floor(_delay*0.1*_fraction/255);
    if(tlm_int(_retry_after,1,21600)) _delay=max(_delay,_retry_after);
    _r.next_attempt_at=tlm_now()+_delay;
    if(!tlm_persist()) {_s.paused=true;_s.status="Attempt status could not be saved. Automatic work is paused.";}
}
function tlm_retry_after(_map) {
    if(!ds_map_exists(_map,"response_headers")) return 0;
    var _headers=_map[? "response_headers"];
    if(!ds_exists(_headers,ds_type_map)) return 0;
    var _key=ds_map_find_first(_headers);var _value=undefined;var _count=0;
    while(!is_undefined(_key) && _count<64) {
        ++_count;
        if(is_string(_key) && string_lower(_key)=="retry-after") {_value=_headers[? _key];break;}
        _key=ds_map_find_next(_headers,_key);
    }
    // V1 accepts bounded delta-seconds only. An untrusted HTTP-date or an
    // overflowing/negative value cannot override the capped local schedule.
    if(!is_string(_value) || string_length(_value)<1 || string_length(_value)>5) return 0;
    for(var _i=1;_i<=string_length(_value);++_i) if(string_pos(string_char_at(_value,_i),"0123456789")==0) return 0;
    var _seconds=real(_value);return tlm_int(_seconds,1,21600) ? _seconds : 0;
}
function tlm_ack_valid(_body,_active,_http) {
    if(!tlm_member(_http,[200,201])) return false;
    var _a=tlm_json_parse(_body,4096,1);
    return tlm_keys(_a,["status","report_id","schema_version","payload_sha256"],["status","report_id","schema_version","payload_sha256"])
        && _a.status=="stored" && tlm_int(_a.schema_version,1,1) && _a.report_id==_active.report_id && _a.payload_sha256==_active.payload_sha256;
}
function tlm_http(_map) {
    if(!tlm_is_ready() || is_undefined(global.telemetry.active)) return false;
    var _s=global.telemetry,_active=_s.active;
    if(!ds_exists(_map,ds_type_map) || !ds_map_exists(_map,"id") || _map[? "id"]!=_active.request_id) return false;
    var _status=ds_map_exists(_map,"status") ? _map[? "status"] : -1;
    if(_status==1) return true; // Preserve correlation throughout progress.
    var _http=ds_map_exists(_map,"http_status") ? _map[? "http_status"] : -1;
    var _body=ds_map_exists(_map,"result") ? _map[? "result"] : "";
    var _accepted=(_status==0 && is_string(_body) && tlm_ack_valid(_body,_active,_http));
    _s.active=undefined;
    if(_active.manual) {
        var _rejected=(_status==0 && tlm_member(_http,[400,401,403,409,413,422]));
        if(!is_undefined(_s.manual) && _s.manual.report.report_id==_active.report_id) {
            _s.manual.status=_accepted ? "The server acknowledged this report." : (_rejected ? "The server rejected this report. No storage acknowledgement was received." : "Attempt completed without a verified receipt. The report may have arrived.");
            _s.manual.approved=false;
        }
        tlm_receipt({report_id:_active.report_id,payload_sha256:_active.payload_sha256},_accepted ? "acknowledged" : (_rejected ? "held_rejected" : "attempted_unknown"),_accepted ? "acknowledged" : (_rejected ? "http_rejected" : "ack_invalid"));
        tlm_persist();return true;
    }
    var _found=false;
    for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].report_id==_active.report_id) {
        _found=true;
        var _r=_s.records[_i];
        if(_accepted) {
            tlm_receipt(_r,"acknowledged","acknowledged");_r.state="discarded";_r.reason="acknowledged";
            if(tlm_remove(tlm_record_path(_r))) array_delete(_s.records,_i,1);else {_r.reason="cleanup_failed";_s.status="The server acknowledged the report, but pending file removal failed.";}
            tlm_persist();
        } else if(_active.withdrawn || _r.generation!=_s.choices.generation || _r.state=="discarded") {
            tlm_receipt(_r,"attempted_unknown","withdrawn");_r.state="discarded";_r.reason="withdrawn";tlm_persist();
        } else if(_status<0) tlm_attempt_failure(_r,"transport_failed",true);
        else if(_http==429 || (_http>=500 && _http<=599)) tlm_attempt_failure(_r,"http_rejected",true,_http==429 ? tlm_retry_after(_map) : 0);
        else tlm_attempt_failure(_r,_http>=200 && _http<=299 ? "ack_invalid" : "http_rejected",false);
        break;
    }
    if(!_found && (_accepted || _active.withdrawn)) {
        tlm_receipt({report_id:_active.report_id,payload_sha256:_active.payload_sha256},_accepted ? "acknowledged" : "attempted_unknown",_accepted ? "acknowledged" : "withdrawn");
        tlm_persist();
    }
    return true;
}
function tlm_step() {
    if(!tlm_is_ready()) return;
    var _s=global.telemetry,_now=tlm_now();
    if(_now<=0 || (_s.last_clock>0 && _now<_s.last_clock)) {
        _s.samples=[];_s.paused=true;_s.status="Paused: diagnostic age cannot be verified after a clock change.";return;
    }
    _s.last_clock=_now;
    if(!is_undefined(_s.manual) && _s.manual.approved && _now>=_s.manual.reviewed_at+1800) {_s.manual.approved=false;_s.manual.status="Review expired. Preview and approve again.";}
    if(_now>=_s.cleanup_at) {_s.cleanup_at=_now+60;tlm_cleanup();}
    if(tlm_field_allowed("performance.fps_mean")) {
        if(_now>=_s.sample_at+1/60) {
            _s.sample_at=_now;
            var _fps=round(fps_real);
            if(tlm_int(_fps,0,1000)) array_push(_s.samples,{at:_now,value:_fps});
            while(array_length(_s.samples)>300 || (array_length(_s.samples)>0 && _s.samples[0].at<_now-5)) array_delete(_s.samples,0,1);
        }
    } else _s.samples=[];
    if(!is_undefined(_s.active)) {
        if(_now>=_s.active.started_at+60) {
            var _active=_s.active;_s.active=undefined;
            if(_active.manual) {
                if(!is_undefined(_s.manual)) {_s.manual.approved=false;_s.manual.status="Timed out. The report may have arrived. Review before any retry.";}
                tlm_receipt({report_id:_active.report_id,payload_sha256:_active.payload_sha256},"attempted_unknown","timeout");tlm_persist();
            }
            else for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].report_id==_active.report_id) {tlm_attempt_failure(_s.records[_i],"timeout",!_active.withdrawn);break;}
        }
        return;
    }
    if(!_s.remote_available || _s.starts>=3) return;
    for(var _j=0;_j<array_length(_s.records);++_j) if(tlm_dispatch_eligible(_s.records[_j])) {tlm_dispatch(_s.records[_j]);break;}
}
function tlm_shutdown() {
    if(!tlm_is_ready()) return false;
    var _s=global.telemetry;_s.manual=undefined;_s.samples=[];
    // No writes at all for a never-enabled, unchanged fresh profile.
    if(!_s.armed) return true;
    if(!is_undefined(_s.active)) return false;
    if(!tlm_persist()) return false;
    if(!tlm_write("guard.json",json_stringify({schema:1,armed:false,sequence:_s.sequence}))) return false;
    _s.armed=false;return true;
}

function tlm_dictionary() {
    var _definitions=[
        {key:"error.frames",label:"Code locations",purpose:"Locate the failing authored script. No raw exception text or paths.",category:"basic",available:global.telemetry.frames_supported},
        {key:"environment.os_release",label:"Windows generation",purpose:"Compare compatibility with a coarse OS family.",category:"device",available:global.telemetry.supported},
        {key:"environment.renderer",label:"Active graphics renderer",purpose:"Compare verified rendering backends.",category:"device",available:false},
        {key:"environment.gpu_vendor",label:"Graphics vendor",purpose:"Compare vendor families without a model or device ID.",category:"device",available:false},
        {key:"context.mode",label:"Game area",purpose:"Distinguish menu, play or editor without content names.",category:"context",available:true},
        {key:"context.content_origin",label:"Content source",purpose:"Distinguish official, custom or no active content.",category:"context",available:true},
        {key:"context.room_id",label:"Built-in room label",purpose:"Locate an authored room without custom names.",category:"context",available:false},
        {key:"performance.fps_mean",label:"Recent frame rate and sample count",purpose:"Summarize up to five seconds, at most 300 samples. No samples while Off.",category:"performance",available:true},
        {key:"performance.process_memory_mib",label:"Coarse process memory",purpose:"Compare process memory in 64 MiB steps.",category:"performance",available:global.telemetry.supported}
    ];
    for(var _i=0;_i<array_length(_definitions);++_i) {
        _definitions[_i].optional=true;
        _definitions[_i].enabled=tlm_get(global.telemetry.choices.fields,_definitions[_i].key,false);
    }
    var _core=[
        {key:"schema_version",label:"Report format version",purpose:"Validate the small versioned format."},
        {key:"kind",label:"Crash report type",purpose:"Identify a crash report; no usage analytics."},
        {key:"report_id",label:"Random report reference",purpose:"Deduplicate this report's retries. It does not identify a player or installation."},
        {key:"game_build",label:"Game build",purpose:"Group failures by the authored code revision."},
        {key:"platform",label:"Build target",purpose:"Identify the verified Windows adapter."},
        {key:"notice_version",label:"Data notice version",purpose:"Identify the scope explained for this report."},
        {key:"submission_mode",label:"Chosen sending route",purpose:"Distinguish automatic from a reviewed one-time report. Local-only records omit this."},
        {key:"error.code",label:"Safe error code",purpose:"Group failures without raw exception text, local paths or globals."}
    ];
    for(var _j=0;_j<array_length(_core);++_j) {_core[_j].category="core";_core[_j].optional=false;_core[_j].available=true;_core[_j].enabled=true;}
    return array_concat(_core,_definitions);
}
function tlm_snapshot() {
    var _s=global.telemetry;var _out=tlm_copy(_s.choices);
    _out.paused=_s.paused;_out.saved=_s.saved;_out.status=_s.status;_out.reason=_s.reason;_out.remote_available=_s.remote_available;_out.destination=_s.destination;_out.data_folder=_s.root;
    _out.effective=tlm_capture_allowed() ? (_s.choices.keep_local ? "Local crash recording" : "Automatic crash reporting") : "Off / paused";
    _out.manual_open=!is_undefined(_s.manual);_out.manual_body=_out.manual_open ? _s.manual.body : "";
    _out.manual_status=_out.manual_open ? _s.manual.status : "";
    _out.last_error_available=_s.last_error_code!="";_out.last_error_code=_s.last_error_code;
    return _out;
}
function tlm_preview_next() {
    return "SYNTHETIC EXAMPLE — no report was captured or sent. Optional measurements appear only when permitted and available.\n"
        +json_stringify({schema_version:1,kind:"crash",report_id:"00000000000040008000000000000001",game_build:global.telemetry.build,
        platform:"windows",notice_version:"sticky-diagnostics-1",submission_mode:"automatic",error:{code:"unclassified"}});
}
function tlm_list() {
    var _s=global.telemetry,_list=[];
    for(var _i=0;_i<array_length(_s.records);++_i) {
        var _r=_s.records[_i];var _body=tlm_read(tlm_record_path(_r),65536);
        var _parsed=tlm_json_parse(_body);
        var _safe=tlm_validate_report(_parsed,_r.store=="pending") && tlm_sha256(_body)==_r.payload_sha256 && tlm_scope_matches(_parsed,_r.allowed_fields);
        array_push(_list,{report_id:_r.report_id,state:_r.state,body:_safe ? _body : "Contents unavailable or invalid. No raw file is shown.",
            created_at:_r.created_at,expires_at:_r.expires_at,reason:_r.reason,manual_available:_safe && tlm_now()<_r.expires_at});
    }
    for(var _j=0;_j<array_length(_s.receipts);++_j) {
        var _r2=_s.receipts[_j];
        array_push(_list,{report_id:_r2.report_id,state:_r2.state,body:"Local status only; no report body. This is not a remote export or deletion record.",
            created_at:_r2.recorded_at,expires_at:_r2.recorded_at+30*86400,reason:_r2.reason,manual_available:false});
    }
    var _disk=tlm_inventory();
    if(!is_undefined(_disk)) for(var _k=0;_k<array_length(_disk.orphans);++_k) {
        var _orphan=_disk.orphans[_k];
        array_push(_list,{report_id:_orphan.report_id,state:"unindexed",body:"Unindexed local file. It is never eligible for automatic sending; its contents were not parsed by startup or inventory.",
            created_at:0,expires_at:0,reason:"recovered",manual_available:false});
    }
    return _list;
}
function tlm_manual_begin(_id="",_code="unclassified") {
    var _s=global.telemetry;var _r=undefined;var _source_expiry=tlm_now()+1800;
    if(_id!="") {
        for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].report_id==_id) {
            var _entry=_s.records[_i];
            if(tlm_now()<_entry.created_at || tlm_now()>=_entry.expires_at) return tlm_result(false,"The retained record has expired or its age is uncertain.");
            var _body=tlm_read(tlm_record_path(_entry),65536);_r=tlm_json_parse(_body);
            if(!tlm_validate_report(_r,_entry.store=="pending") || tlm_sha256(_body)!=_entry.payload_sha256 || !tlm_scope_matches(_r,_entry.allowed_fields)) return tlm_result(false,"The retained record is invalid. It cannot be attached.");
            _source_expiry=_entry.expires_at;break;
        }
    } else {
        if(_s.last_error_code=="" || _code!=_s.last_error_code) return tlm_result(false,"Select a retained crash record or a visible handled error first.");
        _r=tlm_core_report(_code);
    }
    if(is_undefined(_r)) return tlm_result(false,"A safe report and secure random ID are unavailable.");
    var _id2=tlm_secure_id();if(_id2=="") return tlm_result(false,"Secure random report IDs are unavailable. No report was created.");
    _r.report_id=_id2;_r.submission_mode="manual";
    if(!tlm_validate_report(_r,true)) return tlm_result(false,"The report could not be validated.");
    _s.manual={report:_r,body:"",digest:"",approved:false,reviewed_at:0,source_expiry:_source_expiry,generation:_s.choices.generation,
        destination:_s.destination,attempt_count:0,status:"Memory-only draft. Review every field. A new submission can duplicate an earlier uncertain attempt."};
    tlm_manual_freeze();return tlm_result(true,_s.manual.status);
}
function tlm_manual_from_code(_code) {
    if(!is_string(_code) || !tlm_member(_code,tlm_error_codes())) return tlm_result(false,"Choose a known crash code. Arbitrary exception text cannot be attached.");
    var _s=global.telemetry;var _r=tlm_core_report(_code);
    if(is_undefined(_r)) return tlm_result(false,"A safe report, matching notice or secure random ID is unavailable.");
    _r.submission_mode="manual";
    _s.manual={report:_r,body:"",digest:"",approved:false,reviewed_at:0,source_expiry:tlm_now()+1800,generation:_s.choices.generation,
        destination:_s.destination,attempt_count:0,status:"Player-selected crash code. No historical context was recovered. Review this memory-only report before sharing."};
    if(!tlm_manual_freeze()) {_s.manual=undefined;return tlm_result(false,"The manual report could not be validated.");}
    return tlm_result(true,_s.manual.status);
}
function tlm_manual_freeze() {
    var _m=global.telemetry.manual;
    if(is_undefined(_m)) return false;
    _m.approved=false;
    if(!tlm_validate_report(_m.report,true)) {_m.body="";_m.digest="";return false;}
    _m.body=json_stringify(_m.report);_m.digest=tlm_sha256(_m.body);
    return _m.digest!="";
}
function tlm_manual_new_identity() {
    var _m=global.telemetry.manual;var _id=tlm_secure_id();
    if(_id=="") {_m.approved=false;return false;}
    _m.report.report_id=_id;_m.attempt_count=0;return true;
}
function tlm_manual_summary(_text) {
    var _m=global.telemetry.manual;
    if(is_undefined(_m) || !is_string(_text) || string_length(_text)>2000 || string_byte_length(_text)>8192) return tlm_result(false,"Use at most 2000 characters and 8 KiB. Remove personal details or secrets before sharing.");
    if(!is_undefined(global.telemetry.active) && global.telemetry.active.manual) return tlm_result(false,"Wait for the current attempt before changing the report.");
    _text=string_trim(_text);
    if(_text=="") variable_struct_remove(_m.report,"manual");else _m.report.manual={summary:_text};
    if(!tlm_manual_new_identity() || !tlm_manual_freeze()) return tlm_result(false,"The edited report could not be frozen.");
    return tlm_result(true,"Text updated. Review again before export or send.");
}
function tlm_manual_field(_key,_include) {
    var _m=global.telemetry.manual;
    if(is_undefined(_m) || !is_bool(_include) || !tlm_member(_key,tlm_field_ids())) return tlm_result(false,"Unknown optional field.");
    if(_include) return tlm_result(false,"Removed fields cannot be recovered from uncaptured context. Start a new deliberate preview from the retained record.");
    if(!is_undefined(global.telemetry.active) && global.telemetry.active.manual) return tlm_result(false,"Wait for the current attempt before changing the report.");
    var _dot=string_pos(".",_key);var _parent=string_copy(_key,1,_dot-1),_leaf=string_delete(_key,1,_dot);
    if(tlm_has(_m.report,_parent)) {
        var _container=variable_struct_get(_m.report,_parent);variable_struct_remove(_container,_leaf);
        if(_key=="performance.fps_mean") variable_struct_remove(_container,"frame_sample_count");
        if(array_length(variable_struct_get_names(_container))==0) variable_struct_remove(_m.report,_parent);
    }
    if(!tlm_manual_new_identity() || !tlm_manual_freeze()) return tlm_result(false,"The edited report could not be frozen.");
    return tlm_result(true,"Optional field removed. Review again.");
}
function tlm_manual_preview() {
    var _s=global.telemetry,_m=_s.manual;
    if(is_undefined(_m)) return {body:"",digest:"",destination:_s.destination,reason:"No manual crash draft is open."};
    if(_m.destination!=_s.destination) {
        _m.destination=_s.destination;_m.approved=false;
        _m.status="The recipient changed. Review this destination and the exact report again before approval.";
    }
    return {body:_m.body,digest:_m.digest,destination:_m.destination,reason:_m.status};
}
function tlm_manual_approve() {
    var _s=global.telemetry,_m=_s.manual;var _now=tlm_now();
    if(!is_undefined(_m) && _m.destination!=_s.destination) {
        _m.approved=false;return tlm_result(false,"The recipient changed. Open a fresh report preview before approving it.");
    }
    if(is_undefined(_m) || _now<=0 || _now>=_m.source_expiry || _m.body=="" || _m.digest=="" || !tlm_validate_report(tlm_json_parse(_m.body),true)
        || tlm_sha256(_m.body)!=_m.digest) return tlm_result(false,"The report is invalid or expired. Create a new reviewed report.");
    _m.approved=true;_m.reviewed_at=_now;_m.generation=_s.choices.generation;
    _m.status="Reviewed for this one action. Automatic choices are unchanged.";return tlm_result(true,_m.status);
}
function tlm_manual_authorized() {
    var _s=global.telemetry,_m=_s.manual;var _now=tlm_now();
    return !is_undefined(_m) && _m.approved && _now>=_m.reviewed_at && _now<_m.reviewed_at+1800 && _now<_m.source_expiry
        && _m.generation==_s.choices.generation && _m.destination==_s.destination && _m.digest!="" && tlm_sha256(_m.body)==_m.digest
        && tlm_validate_report(tlm_json_parse(_m.body),true);
}
function tlm_manual_send() {
    var _s=global.telemetry;
    if(!_s.remote_available) return tlm_result(false,_s.destination+" You can export a reviewed local copy.");
    if(!tlm_manual_authorized()) return tlm_result(false,"Review and approve the current exact report first.");
    if(!is_undefined(_s.active) || _s.starts>=3 || _s.manual.attempt_count>=5) return tlm_result(false,"The bounded attempt limit is reached, or another report is active.");
    var _m=_s.manual;++_m.attempt_count;++_s.starts;var _id=-1;
    try {_id=_s.adapters.start(_m.body);} catch(_ignored) {}
    if(!is_real(_id) || _id<0) {_m.approved=false;_m.status="The request did not start. Review before a retry.";return tlm_result(false,_m.status);}
    _s.active={request_id:_id,report_id:_m.report.report_id,payload_sha256:_m.digest,manual:true,started_at:tlm_now(),withdrawn:false};
    _m.status="Attempting this reviewed report. No receipt yet.";return tlm_result(true,_m.status);
}
function tlm_manual_export() {
    var _s=global.telemetry;
    if(!tlm_manual_authorized()) return tlm_result(false,"Review and approve the current exact report before exporting.");
    var _m=_s.manual;var _name="export_"+_m.report.report_id+".json";
    if(!tlm_write(_name,_m.body)) return tlm_result(false,"The reviewed copy could not be written and read back.");
    _m.approved=false;_m.status="Reviewed copy exported locally. Exported copies are outside automatic expiry. Nothing was sent.";
    return tlm_result(true,_m.status);
}
function tlm_manual_cancel() {
    var _s=global.telemetry;
    if(!is_undefined(_s.active) && _s.active.manual) {
        try {_s.adapters.cancel(_s.active.request_id);} catch(_ignored) {} _s.active.withdrawn=true;
        tlm_receipt({report_id:_s.active.report_id,payload_sha256:_s.active.payload_sha256},"attempted_unknown","withdrawn");tlm_persist();
    }
    _s.manual=undefined;return tlm_result(true,"Manual draft discarded from memory. A dispatched report may already have arrived.");
}
function tlm_delete(_kind) {
    var _s=global.telemetry;
    if(!tlm_member(_kind,["pending","local","receipts","legacy"])) return tlm_result(false,"Unknown deletion scope.");
    if(_kind=="legacy") return tlm_result(false,"Legacy crash/debug files are separate. Review or remove them deliberately in their local folders; they are never uploaded by this system.");
    if(_kind=="receipts") {_s.receipts=[];return tlm_result(tlm_persist(),"Local status deletion does not remove reports held by a server.");}
    if(_kind=="pending") tlm_restrict("user_deleted");
    for(var _i=0;_i<array_length(_s.records);++_i) if(_s.records[_i].store==_kind) {_s.records[_i].state="discarded";_s.records[_i].reason="user_deleted";}
    // First persist ineligibility. Failed removal never makes a body eligible.
    if(!tlm_persist()) {_s.paused=true;return tlm_result(false,"Deletion state could not be saved. Sending is paused and restart requires review.");}
    tlm_cleanup();
    var _disk=tlm_inventory();var _orphan_failed=is_undefined(_disk);
    if(!is_undefined(_disk)) for(var _k=0;_k<array_length(_disk.orphans);++_k) if(_disk.orphans[_k].store==_kind) {
        if(!tlm_remove(_disk.orphans[_k].name)) _orphan_failed=true;
    }
    if(_orphan_failed) return tlm_result(false,"Some unindexed local files could not be removed or listed. They remain ineligible and occupy quota. Server copies are unaffected.");
    for(var _j=0;_j<array_length(_s.records);++_j) if(_s.records[_j].store==_kind && _s.records[_j].state=="discarded") return tlm_result(false,"Some local files could not be removed. They remain ineligible. Server copies are unaffected.");
    return tlm_result(true,"Selected local copies removed. Server copies are unaffected.");
}
