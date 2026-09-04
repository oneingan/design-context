# Vocabulary Drift Checklist

## Summary

- Vocabulary drift happens when names, meanings, or aliases diverge across artifacts.
- Run this checklist whenever important terms are introduced, renamed, or questioned.
- The goal is to keep humans and agents aligned on the same core language.

## Use this when

- introducing a new term
- renaming a canonical artifact
- reviewing an area with many overlapping terms
- noticing ambiguity in discussions or documents

## Checklist

- [ ] the canonical term is explicit
- [ ] the term is defined in the correct glossary scope
- [ ] aliases, if any, are recorded intentionally
- [ ] decision-relevant terms retain their source, perspective, and working knowledge status
- [ ] confirmed meaning names the accountable validator and scope; inferred or speculative meaning is not presented as settled
- [ ] disputed meanings and unknowns remain visible until resolved
- [ ] represented and materially missing participant perspectives are visible
- [ ] nearby principles, playbooks, manifests, and review docs use the same term consistently
- [ ] no conflicting meaning exists in the same scope
- [ ] technical placeholder names are not displacing the domain term by accident
- [ ] fashionable AI or architecture terms are not being used with multiple meanings in the same scope
- [ ] linguistic clues were tested with contrasting scenarios before a data shape or abstraction was stabilized
- [ ] an ADR was written if the rename changes structure or meaning substantially

## Review prompts

- Did anything get renamed without a glossary update?
- Are two near-synonyms competing in the same area?
- Would an agent know which term to prefer?
- Is a term undergoing semantic diffusion, such as `vibe coding`, `agentic programming`, `harness`, `skill`, or `agent`?
- Did a transport or tool name become the dominant concept label?
- Was an observed, inferred, or speculative use silently promoted to confirmed meaning?
- Whose language is absent, and who is accountable for resolving consequential disagreement?

## Related docs

- `context/glossary/01-framework-glossary.md`
- `context/glossary/02-naming-and-term-introduction.md`
- `context/principles/02-ubiquitous-language-and-naming.md`
- `context/playbooks/01-domain-modeling-playbook.md`
