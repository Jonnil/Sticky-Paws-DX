"""Author a finite build registry from registered source, never runtime names."""
from pathlib import Path
import hashlib, json, re

root = Path(__file__).resolve().parents[2]
asset = root/'scripts/scr_telemetry_frames'
asset.mkdir(exist_ok=True)
gml = '''/// Authored build mapping. No runtime/user names become registry entries.
function tlm_frame_registry()
{
    static _loaded = false;
    static _registry = undefined;
    if (!_loaded)
    {
        _loaded = true;
        if (os_type != os_windows) return undefined;
        var _bytes = tlm_native_read("telemetry_frames.json", 262144);
        if (string_byte_length(_bytes) != REGISTRY_SIZE) return undefined;
        var _digests = REGISTRY_DIGESTS;
        var _parsed = undefined;
        try
        {
            // Only this exact authored ASCII artifact uses direct native hashing
            // and parsing. Length plus every SHA-256 pin authenticate its bytes.
            // A NUL/truncation or changed UTF-8 chunk cannot match those pins.
            for (var _part = 0; _part < array_length(_digests); _part++)
                if (tlm_native_sha256(string_copy(_bytes, _part * 60000 + 1, 60000)) != _digests[_part]) return undefined;
            _parsed = json_parse(_bytes, undefined, true);
        }
        catch (_invalid_authored_artifact) { return undefined; }
        if (!is_struct(_parsed) || tlm_get(_parsed,"schema",0) != 1
            || tlm_get(_parsed,"game_build","") != "sp-telemetry-v1-dev") return undefined;
        _registry = _parsed;
    }
    return _registry;
}

function tlm_authored_frames_ready(_build)
{
    var _registry = tlm_frame_registry();
    return is_struct(_registry) && _build == _registry.game_build;
}

function tlm_authored_frame(_resource, _ev = undefined, _line = undefined)
{
    var _registry = tlm_frame_registry();
    if (!is_struct(_registry) || !is_string(_resource)
        || !variable_struct_exists(_registry.resources, _resource)) return false;
    if (!is_undefined(_ev) && (!is_string(_ev)
        || !tlm_member(_ev, variable_struct_get(_registry.resources, _resource)))) return false;
    if (!is_undefined(_line) && !tlm_int(_line, 1, 1000000)) return false;
    return true;
}

/// Parse only an allowed crash's optional frames. Exact authored symbol lookup;
/// raw messages, arguments, stack arrays and source text are never serialized.
function scr_telemetry_safe_frames(_stack)
{
    if (!tlm_is_ready() || !tlm_capture_allowed() || !tlm_field_allowed("error.frames")) return undefined;
    var _registry = tlm_frame_registry();
    if (!is_struct(_registry) || !is_array(_stack)) return undefined;
    var _frames = [];
    for (var _i = 0; _i < min(array_length(_stack), 16); _i++)
    {
        var _raw = _stack[_i];
        if (!is_string(_raw) || string_length(_raw) > 1024) continue;
        var _marker = string_pos(" (line ", _raw);
        var _symbol = _marker > 0 ? string_copy(_raw, 1, _marker - 1) : _raw;
        if (!variable_struct_exists(_registry.symbols, _symbol)) continue;
        var _known = variable_struct_get(_registry.symbols, _symbol);
        var _frame = {resource:_known.resource};
        if (tlm_has(_known, "event")) _frame.event = _known.event;
        if (_marker > 0)
        {
            var _rest = string_copy(_raw, _marker + 7, 8);
            var _end = string_pos(")", _rest);
            if (_end > 1 && _end <= 8)
            {
                var _number = string_copy(_rest, 1, _end - 1);
                var _digits = true;
                for (var _n = 1; _n <= string_length(_number); _n++)
                    if (string_pos(string_char_at(_number, _n), "0123456789") == 0) _digits = false;
                if (_digits)
                {
                    var _line = real(_number);
                    if (tlm_int(_line, 1, 1000000)) _frame.line = _line;
                }
            }
        }
        if (tlm_authored_frame(_frame.resource, tlm_get(_frame,"event"), tlm_get(_frame,"line"))) array_push(_frames, _frame);
    }
    return array_length(_frames) > 0 ? _frames : undefined;
}
'''
(asset/'scr_telemetry_frames.gml').write_text(gml,encoding='utf-8')
(asset/'scr_telemetry_frames.yy').write_text(json.dumps({"$GMScript":"v1","%Name":"scr_telemetry_frames","isCompatibility":False,"isDnD":False,"name":"scr_telemetry_frames","parent":{"name":"Scripts","path":"folders/Scripts.yy"},"resourceType":"GMScript","resourceVersion":"2.0"},indent=2),encoding='utf-8')
project=root/'Sticky Paws DX.yyp'
source=project.read_text(encoding='utf-8-sig')
if 'scripts/scr_telemetry_frames/scr_telemetry_frames.yy' not in source:
    source=source.replace('  "resources":[\n','  "resources":[\n    {"id":{"name":"scr_telemetry_frames","path":"scripts/scr_telemetry_frames/scr_telemetry_frames.yy",},},\n',1)
if '"name":"telemetry_frames.json"' not in source:
    source=source.replace('  "IncludedFiles":[\n','  "IncludedFiles":[\n    {"$GMIncludedFile":"","%Name":"telemetry_frames.json","CopyToMask":-1,"filePath":"datafiles","name":"telemetry_frames.json","resourceType":"GMIncludedFile","resourceVersion":"2.0",},\n',1)
project.write_text(source,encoding='utf-8',newline='\n')
project_data=json.loads(re.sub(r',(\s*[}\]])',r'\1',source))
resources={};symbols={}
def symbol(name, resource, event=None):
    entry={"resource":resource}
    if event and re.fullmatch(r'[A-Za-z0-9_.-]{1,32}',event):
        entry['event']=event;resources[resource].add(event)
    # Ambiguous names are not safe mappings. Remove all conflicting meanings.
    if name in symbols and symbols[name] != entry:
        symbols[name]=None
    elif name not in symbols:
        symbols[name]=entry
for row in project_data['resources']:
    rel=row['id']['path'];name=row['id']['name']
    if not re.fullmatch(r'[A-Za-z0-9_.-]{1,64}',name): continue
    if rel.startswith('scripts/'):
        resources[name]=set()
        symbol('gml_GlobalScript_'+name,name)
        path=root/rel.replace('.yy','.gml')
        text=path.read_text(encoding='utf-8-sig')
        # Source-authored identifier tokens only. Never derive names from state.
        for function in re.findall(r'\bfunction\s+([A-Za-z_][A-Za-z_0-9]*)\s*\(',text):
            symbol('gml_Script_'+function,name,function)
    elif rel.startswith('objects/'):
        resources[name]=set()
        for path in (root/rel).parent.glob('*.gml'):
            event=path.stem
            if re.fullmatch(r'[A-Za-z_]+_[0-9]+',event): symbol('gml_Object_'+name+'_'+event,name,event)
registry={'schema':1,'game_build':'sp-telemetry-v1-dev',
          'resources':{key:sorted(value) for key,value in sorted(resources.items())},
          'symbols':{key:value for key,value in sorted(symbols.items()) if value is not None}}
raw=json.dumps(registry,ensure_ascii=True,separators=(',',':')).encode('utf-8')
if len(raw)>262144: raise RuntimeError('Authored mapping exceeds bound')
(root/'datafiles/telemetry_frames.json').write_bytes(raw)
digest=hashlib.sha256(raw).hexdigest()
chunks=[hashlib.sha256(raw[i:i+60000]).hexdigest() for i in range(0,len(raw),60000)]
(asset/'scr_telemetry_frames.gml').write_text(gml.replace('REGISTRY_SIZE',str(len(raw))).replace('REGISTRY_DIGESTS',json.dumps(chunks,separators=(',',':'))),encoding='utf-8')
print(json.dumps({'resources':len(resources),'symbols':len(registry['symbols']),'bytes':len(raw),'sha256':digest}))
