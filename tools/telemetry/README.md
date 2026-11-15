# Diagnostic contract checks

This directory contains an **isolated receiver contract**, not the deployed
Sticky Paws service. The shipping client has no configured diagnostic transport;
remote delivery remains unavailable. Never point these fixtures at player data,
the legacy endpoint or a production storage bucket.

From this directory, using a supported Python installation:

```powershell
$env:PYTHONDONTWRITEBYTECODE = '1'
python -m unittest -v test_receiver_contract
```

The tests use synthetic UTF-8 reports and a disposable SQLite database. They
exercise typed closed validation, duplicate JSON keys, durable acknowledgement,
reopening storage after a lost acknowledgement, identical retries, ID/body
conflicts, expiry and storage failure. They do not prove a cloud deployment,
authentication, HTTP adapter, log configuration, backups or rights handling.

`make_contract_cases.py` regenerates `contract_cases.json`. The same corpus runs
through the actual GML validator in `scr_telemetry_contract_tests`. Both test
scripts are intentionally unregistered in the shipping `.yyp`. A development
harness must register them, the core/platform/frame scripts and native extension,
include the corpus/notice/frame files, call `tlm_run_tests()` followed by
`tlm_run_contract_tests()`, write the structured results to its disposable profile
and exit. Injected transport never sends HTTP. A helper's passing tests do not
replace compilation and ordinary-game/menu checks.

`build_frames.py` creates the finite authored resource/symbol registry and its
GML digest pins from this project. Run it after deliberate source/resource/build
changes and review the generated diff. It does not discover runtime identities,
content names or paths. Match the authored build label in core, registry and
receiver before integrating another build. Unknown frames remain absent or are
rejected; do not replace the registry with raw stack text.

The isolated receiver acknowledges only after its SQLite transaction commits:
`status: stored`, `report_id`, `schema_version`, and SHA-256 `payload_sha256` must match the
exact received bytes. Integrating the real service requires the matching protocol,
accepted-build registry, production security/operations review and synthetic
end-to-end evidence. A bare HTTP 200 or transport completion is insufficient.

The Academy Diagnostics implementation record contains T01–T17, the menu issue
IDs, actual verification evidence and remaining release prerequisites. Private
campaign records preserve failed builds and machine-specific execution paths.
