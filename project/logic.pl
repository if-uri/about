% ── Project Metadata ─────────────────────────────────────
project_metadata('about', '0.0.0', 'python').

% ── Project Files ────────────────────────────────────────
project_file('app.doql.less', 35, 'less').
project_file('assets/ifuri-ecobar.js', 106, 'javascript').
project_file('project.sh', 66, 'shell').
project_file('scripts/check.py', 71, 'python').
project_file('scripts/deploy-plesk.sh', 15, 'shell').
project_file('tree.sh', 5, 'shell').

% ── Python Functions ─────────────────────────────────────
python_function('scripts/check.py', 'main', 0, 8, 7).

% ── Python Classes ───────────────────────────────────────
python_class('scripts/check.py', 'Counter').
python_method('Counter', '__init__', 0, 1, 2).
python_method('Counter', 'handle_starttag', 2, 2, 1).
python_method('Counter', 'handle_endtag', 1, 2, 1).

% ── Dependencies ─────────────────────────────────────────

% ── Makefile Targets ─────────────────────────────────────
makefile_target('help', '').
makefile_target('serve', '').
makefile_target('test', '').
makefile_target('deploy', '').

% ── Taskfile Tasks ───────────────────────────────────────

% ── Environment Variables ────────────────────────────────

% ── TestQL Scenarios ─────────────────────────────────────

% ── Semantic Facts from SUMD.md ──────────────────────────
sumd_declared_file('app.doql.less', 'doql').
sumd_declared_file('project/map.toon.yaml', 'analysis').
sumd_declared_file('project/logic.pl', 'analysis').
sumd_declared_file('project/calls.toon.yaml', 'analysis').
sumd_interface('web', '').
sumd_workflow('serve', 'manual').
sumd_workflow_step('serve', 1, 'python3 -m http.server $(PORT)').
sumd_workflow('test', 'manual').
sumd_workflow_step('test', 1, 'python3 scripts/check.py').
sumd_workflow('deploy', 'manual').
sumd_workflow_step('deploy', 1, 'bash scripts/deploy-plesk.sh').

