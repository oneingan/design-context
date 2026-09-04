# Errors and Edge Responsibilities

## Summary

- Prefer designs that prevent invalid states over designs that merely catch them later.
- Keep confirmed failure distinct from an unknown outcome.
- Keep transport, persistence, serialization, vendor, and agent-runtime details at the edges.
- Translate edge observations without turning delivery mechanisms into business consequences.
- Make retry, idempotency, authority, and reconciliation responsibilities explicit.

## Load this when

- defining validation and failure behavior
- deciding where persistence or integration logic belongs
- reviewing boundary purity
- deciding how to document edge concerns without polluting the core model

## Principle

Not all failures are the same. Some are domain-significant and belong in the model. Others are operational accidents of the environment. Good design distinguishes them clearly and prevents the latter from distorting the former.

## Error rules

### 1. Prefer prevention over rescue

Use the model, glossary, schemas, state tables, and checklists to make invalid interpretations harder.

Do not rely on a late generic catch-all as the primary design mechanism.

### 2. Classify errors and outcomes by meaning

At minimum, distinguish:
- domain rejection: a business rule says no
- boundary or contract failure: the input or interaction shape is wrong
- confirmed operational failure: evidence establishes that an edge action could not complete
- unknown outcome: evidence does not establish whether a requested effect occurred

This separation keeps workflows understandable. An unknown outcome is not another name for a confirmed failure.

### 3. Do not infer business outcome from an edge symptom

A timeout proves that the caller did not observe a response within a limit. It does not prove whether the dependency accepted, rejected, or completed the request. Translate the observation into the most precise stable result supported by evidence, including `unknown outcome` when necessary.

The domain workflow decides what that result means: remain pending, reconcile, stop accepting new attempts, compensate, escalate, or remediate. Transport labels must not make that decision accidentally.

### 4. Keep domain errors close to the domain

If a failure changes business meaning, the model should name it directly.

Examples:
- order already cancelled
- claim window expired
- credit limit exceeded

These should not be hidden under vague technical labels.

### 5. Keep operational details at the edge

The core model should not need to know about:
- HTTP status codes
- message broker partitions
- storage driver exceptions
- vendor SDK exception types
- agent runner protocols or issue-tracker API details

Translate these into stable boundary results or operational categories before they move inward.

### 6. Separate retry mechanism from business consequence

The domain workflow decides whether the same business intention remains eligible for another attempt. Within that allowance, attempt or time budgets, backoff, and scheduling are edge policies. Select them from explicit business constraints such as value at stake, duplicate-effect risk, deadlines, customer impact, and the cost of waiting, together with dependency limits. There is no universal retry count or delay.

Exhausting a retry budget is an operational fact. It does not by itself mean business rejection or prove that an earlier attempt failed; report it through the stable seam and map it to an explicit workflow state and recovery path.

### 7. Preserve intention through an idempotency representation

The domain owns the identity and duplicate semantics of a business intention. An edge contract may represent that identity with an idempotency key for one defined scope. The key does not create or replace the intention.

Reuse the mapped key when retrying the same intention. A fresh key must not silently turn a delivery retry into a second business action; a genuinely new intention requires a domain-authorized transition.

### 8. Name authority and reconciliation responsibilities

For each business-significant external fact, state:
- which source is authoritative for asserting the external fact
- which bounded context owns its local state and business consequence
- who or what reconciles missing or conflicting observations
- which evidence permits the workflow to leave an unknown state

Do not assume one system is authoritative for every fact. Preserve disagreement until the relevant authority can be consulted, then apply the owning context's rules for compensation, escalation, or remediation.

### 9. Document remaining edge responsibilities

At the edges, be clear about who handles:
- validation of external shape
- serialization or deserialization
- persistence mapping
- authentication or authorization seams
- approval or sandbox policies for agent runtimes
- diagnostic logging, tracing, or metrics emission

### 10. Keep side-effect adapters replaceable

If an external dependency changes, the core model and its main principles should remain mostly intact.

### 11. Keep unresolved classification visible

An unclassified error means its meaning is unresolved. An unknown outcome means the uncertainty itself is known but the effect is not. Keep either visible rather than forcing it into a misleading failure category.

## Core vs edge guideline

| Concern | Preferred location |
|---|---|
| business rules and consequences | core model |
| invariant definitions | core model |
| outcomes and state transitions, including unknown outcome | core model |
| intention identity and duplicate meaning | core model |
| external fact authority and ownership agreement | boundary/context relationship |
| input shape and idempotency-key mapping | edge |
| transport and persistence details | edge |
| retry budget, backoff, and scheduling | edge |
| reconciliation queries or delivery mechanisms | edge |
| vendor-specific behavior | edge |

## Minimum error documentation

A meaningful workflow or boundary description should usually answer:

- what outcomes are domain rejections, confirmed failures, or still unknown?
- what failures are input or contract problems?
- where are observations detected and translated?
- which source is authoritative for each disputed fact?
- how are retries correlated to one business intention?
- who reconciles disagreement and decides the business consequence?
- what can the caller or downstream context rely on?

## Review questions

- Does the core model depend on transport or storage details?
- Are business-significant failures named in domain language?
- Could a timeout or exhausted retry budget be mistaken for a confirmed failure?
- Are retry and idempotency mechanisms governed by business intent and risk?
- Are authority and reconciliation explicit when systems may disagree?
- Have we prevented obvious invalid states rather than only catching them?
- Would a dependency change force unnecessary model changes?

## Related docs

- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/principles/04-workflows-invariants-and-state.md`
- `context/principles/06-deep-modules-and-information-hiding.md`
