# Pi Runtime Smoke Benchmark: Release Candidate

## Summary

- Trigger: pre-release smoke test of `design-context` with the local Pi runtime and existing authentication.
- Input type: model behavior and tooling evidence.
- Runtime: `pi 0.73.0`, provider `openai-codex`, OAuth auth present and redacted.
- Scope: read-only smoke prompts against the current repo; no file writes, edits, or shell tools were exposed to the agent runs.
- Result: 24/24 Pi runs completed without runtime errors or timeouts.
- Strict automated scoring: 19/24 passed.
- Manual review of the five strict-score misses found no release blocker: three were scorer wording false negatives and two were acceptable alternate retrieval choices.
- Recommendation: release can proceed from a Pi-runtime smoke-test perspective.

## Setup

Command shape used for each matrix run:

```bash
PI_SKIP_VERSION_CHECK=1 PI_TELEMETRY=0 \
pi --no-session --mode json \
  --model openai-codex/<model> \
  --thinking <minimal|high> \
  --tools read,grep,find,ls \
  --no-extensions --no-skills --no-prompt-templates \
  --append-system-prompt '<read-only benchmark constraints>' \
  '<prompt>'
```

Read-only guardrails:

- enabled tools: `read`, `grep`, `find`, `ls`
- disabled tools: `write`, `edit`, `bash`
- sessions disabled with `--no-session`
- extensions, skills, and prompt templates disabled for repeatability

## Auth and model preflight

Observed auth entries, redacted:

| Provider | Type |
|---|---|
| `openai-codex` | OAuth |

`pi --list-models` returned only `openai-codex` models. A quick auth probe found these outcomes:

| Model | Outcome |
|---|---|
| `gpt-5.1`, `gpt-5.1-codex-max`, `gpt-5.1-codex-mini`, `gpt-5.2-codex` | rejected by provider for this ChatGPT account |
| `gpt-5.2`, `gpt-5.3-codex`, `gpt-5.3-codex-spark`, `gpt-5.4`, `gpt-5.4-mini`, `gpt-5.5` | worked in minimal no-tools probe |

The benchmark matrix used:

- `gpt-5.3-codex-spark`
- `gpt-5.4-mini`
- `gpt-5.5`

Thinking levels:

- `minimal`
- `high`

Prompt families:

- `agent_operability_retrieval`
- `vendoring_boundary`
- `design_deviation_adr`
- `architecture_deepening`

## Aggregate results

| Model | Runs | Strict-score pass | Duration | Estimated cost |
|---|---:|---:|---:|---:|
| `gpt-5.3-codex-spark` | 8 | 7 | 128.81s | $0.000000 |
| `gpt-5.4-mini` | 8 | 6 | 164.85s | $0.113512 |
| `gpt-5.5` | 8 | 6 | 177.03s | $0.659073 |
| **Total** | **24** | **19** | **470.69s** | **$0.772585** |

| Prompt | Runs | Strict-score pass | Notes |
|---|---:|---:|---|
| `agent_operability_retrieval` | 6 | 4 | Two misses chose plausible alternate leaf docs instead of the expected playbook. |
| `vendoring_boundary` | 6 | 6 | Robust across all tested combinations. |
| `design_deviation_adr` | 6 | 3 | Three strict-score misses were wording false negatives; manual review passed them. |
| `architecture_deepening` | 6 | 6 | Robust across all tested combinations. |

## Manual review of strict-score misses

| Run | Automated result | Manual assessment |
|---|---|---|
| `gpt-5.3-codex-spark` / `minimal` / `design_deviation_adr` | fail | Pass. Included all design-deviation fields and correctly said no ADR for a one-off local deviation. |
| `gpt-5.4-mini` / `minimal` / `design_deviation_adr` | fail | Pass. Included all fields and correct ADR distinction; scorer missed wording. |
| `gpt-5.5` / `high` / `design_deviation_adr` | fail | Pass. Included all fields and correct ADR distinction; scorer missed wording. |
| `gpt-5.4-mini` / `high` / `agent_operability_retrieval` | fail | Acceptable. Chose checklist plus ADR 0006 rather than playbook; useful for an audit, but slightly less aligned with the map's make-agent-ready path. |
| `gpt-5.5` / `minimal` / `agent_operability_retrieval` | fail | Acceptable. Chose checklist plus orchestration patterns rather than playbook; still relevant to audit. |

## Findings

- Pi runtime and OAuth auth worked for the selected supported models.
- Provider model availability is account-specific; `--list-models` listed some models rejected by this ChatGPT-account-backed `openai-codex` auth.
- Vendoring-boundary guidance is very stable: every tested combination correctly excluded `docs/research/**` and listed the core pack paths.
- Architecture-deepening guidance is very stable: every tested combination rejected the duplicate link-index doc using deletion-test/pass-through rationale.
- `design deviation` guidance is usable across models; failures were scoring-string brittleness, not model failure.
- Agent-operability retrieval is good but slightly ambiguous for the word "audit": some models prefer the checklist plus ADR/patterns over the playbook plus checklist.

## Release decision

No release blocker found.

No canonical changes are required before release. If this ambiguity recurs in future tests, consider a small wording tweak to distinguish:

- making a repo agent-ready: playbook first, then patterns/checklist;
- auditing agent-operability: checklist first, then playbook/patterns/ADR as needed.

## Raw artifacts

Temporary raw outputs were written to:

```text
/tmp/design-context-pi-smoke-48QofE/
```

These are not part of the vendored core pack.

## Related docs

- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/context-window-strategy.md`
- `context/review/01-quality-gates.md`
- `context/review/06-agent-operability-checklist.md`
