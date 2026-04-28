# Vision

## Product vision

Build a reusable repository of agent-readable context that helps design and evolve software systems with strong boundaries, clear domain language, explicit workflows, and low accidental complexity.

## What it should feel like

An agent using this repo should feel like it was handed:

- a concise architectural compass
- a domain-modeling handbook
- a set of practical review checklists
- a retrieval map that avoids context overload

## Core principles

1. **Language-agnostic core**
   The most important ideas should not depend on Python, Go, TypeScript, Rust, or any specific framework.

2. **Domain before implementation**
   The repo should help agents understand language, boundaries, states, decisions, and invariants before producing code.

3. **Progressive disclosure**
   High-level maps first; detailed leaf docs later.

4. **Deep modules, shallow entrypoints**
   Navigation should stay simple while specialized detail is pushed into focused documents.

5. **Explicit design decisions**
   Important trade-offs should live in ADRs instead of being rediscovered every session.

6. **Reusable across projects**
   The framework should work as a reference corpus, a starter pack, or a source for project-specific agent instructions.

## Non-goals for early versions

- not a giant monolithic handbook
- not a language cookbook
- not a code generator
- not a replacement for project-specific context

## Desired long-term outcomes

- shared design language across projects
- easier architecture reviews with AI agents
- smaller prompt payloads through better retrieval structure
- better consistency when switching languages or stacks
