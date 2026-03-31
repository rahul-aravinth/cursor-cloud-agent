#!/usr/bin/env bash
# Sample Cursor hook (command type).
#
# How this works:
# 1. Cursor runs this script when the hook fires (here: afterFileEdit).
# 2. A JSON document describing the event is written to our stdin — shape depends on the hook; see:
#    https://cursor.com/docs/hooks
# 3. We should read stdin (even if we ignore it) so the pipe does not block.
# 4. Optional: print JSON to stdout to return structured data (e.g. permission, additional_context).
#    This sample only consumes input and exits successfully.
# 5. Exit codes (command hooks): 0 = use stdout JSON if any; 2 = block action (deny); other = fail-open unless failClosed.
#
# Project hooks run from the repository root; hooks.json uses paths like .cursor/hooks/...

cat >/dev/null
exit 0
