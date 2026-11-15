"""Shared client/receiver acceptance corpus; synthetic values only."""
import copy
import json
from pathlib import Path

def cases():
    base = {"schema_version":1,"kind":"crash","report_id":"00000000000040008000000000000001",
            "game_build":"sp-telemetry-v1-dev","platform":"windows","notice_version":"sticky-diagnostics-1",
            "submission_mode":"automatic","error":{"code":"unclassified"}}
    rows = []
    def add(name, value, accepted=True):
        rows.append({"name":name,"body":json.dumps(value, ensure_ascii=False, separators=(",",":")),"accepted":accepted})
    add("minimum", base)
    framed=copy.deepcopy(base)
    framed["error"]["frames"]=[{"resource":"scr_telemetry_core","event":"tlm_step","line":1}]
    add("authored_code_frame",framed)
    manual = copy.deepcopy(base)
    manual.update(submission_mode="manual", manual={"summary":"Synthetic café, 猫, 🐾"})
    add("manual_utf8", manual)
    all_optional = copy.deepcopy(base)
    all_optional.update(environment={"os_release":"windows_11","renderer":"d3d11","gpu_vendor":"amd"},
                        context={"mode":"editor","content_origin":"custom"},
                        performance={"fps_mean":0,"frame_sample_count":1,"process_memory_mib":0})
    add("selected_closed_values_and_real_zero", all_optional)
    for key, value in [("schema_version",1.0),("schema_version",True),("schema_version",2),
                       ("report_id","ABC"),("game_build","unreviewed-build"),("platform","unknown"),
                       ("notice_version","future"),("submission_mode","unknown"),("user_id","SECRET_MARKER")]:
        v=copy.deepcopy(base);v[key]=value
        add("root_"+key+"_"+str(value),v, key=="schema_version" and type(value) is float)
    for key in base:
        v=copy.deepcopy(base);del v[key];add("missing_"+key,v,False)
    for group, value in [("error",{"code":"unclassified","message":"SECRET_MARKER"}),
                         ("error",{"code":"unclassified","frames":[{"resource":"arbitrary"}]}),
                         ("context",{"room_id":"arbitrary"}),("context",{}),
                         ("context",{"mode":"SECRET_MARKER"}),
                         ("environment",{"os_release":None}),
                         ("environment",{"renderer":{"secret":"SECRET_MARKER"}}),
                         ("performance",{"fps_mean":60}),
                         ("performance",{"fps_mean":False,"frame_sample_count":1}),
                         ("performance",{"process_memory_mib":65}),
                         ("manual",{"summary":"automatic text forbidden"})]:
        v=copy.deepcopy(base);v[group]=value;add("nested_"+group+"_"+str(len(rows)),v,False)
    v=copy.deepcopy(manual);v["manual"]["summary"]="x"*2001;add("manual_character_limit",v,False)
    v=copy.deepcopy(manual);v["manual"]["summary"]=" \n\t ";add("manual_empty",v,False)
    raw=json.dumps(base,separators=(",",":"))
    rows += [{"name":"duplicate_key","body":raw[:-1]+',"schema_version":1}',"accepted":False},
             {"name":"duplicate_escaped_key","body":raw[:-1]+',"schema_vers\\u0069on":1}',"accepted":False},
             {"name":"trailing_comma","body":raw[:-1]+',}',"accepted":False},
             {"name":"oversized_body","body":" "*65537,"accepted":False}]
    return rows

if __name__ == "__main__":
    target=Path(__file__).with_name("contract_cases.json")
    target.write_text(json.dumps(cases(),ensure_ascii=False,indent=2),encoding="utf-8")
    print(f"Wrote {len(cases())} shared synthetic cases")
