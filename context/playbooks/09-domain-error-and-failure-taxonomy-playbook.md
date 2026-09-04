# Domain Error and Failure Taxonomy Playbook

## Summary

- Start from workflow meaning and invariants, not from exception classes or transport codes.
- Distinguish domain rejections, contract failures, confirmed operational failures, unknown outcomes, and unexpected outcomes.
- Translate edge observations into stable envelopes without inventing business consequences.
- Record authority, recovery mechanics, reconciliation, and business ownership separately.

## Use this when

- defining a workflow failure model
- reviewing whether edge concerns are leaking into the core
- creating a stable error surface for callers or neighboring contexts
- clarifying retry, escalation, or compensation responsibilities

## Inputs

- workflow description
- invariants and forbidden situations
- trust-boundary notes
- external dependencies and contracts
- authority for business-significant facts
- value, risk, deadline, and customer-impact constraints on recovery

## Steps

### 1. Start from the workflow goal

Ask:
- what business result is this workflow trying to produce?
- what explicit rejections are part of normal business behavior?
- what must stay true before and after the workflow?
- whose evidence can establish whether an external effect occurred?

### 2. List failure points by stage

Walk the workflow from input to output.
For each stage, note what can go wrong at:
- intake or parsing
- validation and trust earning
- domain decision points
- cross-context or external calls
- persistence or message emission

### 3. Classify failures and outcome uncertainty by meaning

Use at least these categories:

| Category | Meaning | Example |
|---|---|---|
| domain rejection | the business rule says no | claim window closed |
| contract failure | the shape or boundary interaction is wrong | malformed request payload |
| confirmed operational failure | evidence establishes that an edge action could not complete | storage rollback confirmed |
| unknown outcome | evidence cannot establish whether the requested effect occurred | response timed out after a charge was submitted |
| unexpected outcome | valid signal arrives in the wrong state or sequence | payment success with no pending order |

`Unknown outcome` is a modeled status, not a confirmed-failure subtype. Also keep an unclassified error distinct: its meaning is unknown, whereas the outcome category above has a precise meaning about missing evidence.

### 4. Decide what crosses the boundary

Not every edge detail deserves the same visibility.
Ask:
- should this stay local to the edge adapter?
- should this become a stable inward failure or outcome category?
- does the caller need the exact detail, or only a translated envelope?
- could collapsing the detail falsely turn uncertainty into failure?

### 5. Translate only as far as evidence permits

Examples:
- explicit provider rejection → `payment rejected`
- response timeout after submission → `payment outcome unknown`
- confirmed storage rollback → `state persistence failed`
- transport parse errors → `invalid request`

Keep detailed originals for diagnostics, but do not let them become core language or stronger claims than the evidence supports.

### 6. Separate recovery mechanics from business policy

Record whether the workflow still permits another attempt of the same business intention. At the edge, assign bounded retry or time budgets, backoff, and scheduling based on value at stake, duplicate risk, deadlines, customer impact, and dependency limits. Keep the same intention and mapped idempotency key across those attempts.

Budget exhaustion is an operational observation, not proof of rejection or non-execution. Name the workflow state and the domain owner who decides whether to wait, reconcile, escalate, compensate, or remediate.

### 7. Record authority and reconciliation

For each significant failure or uncertain outcome, note:
- where the observation is detected and translated
- which source is authoritative for the disputed external fact
- which bounded context owns local state and business consequences
- who runs reconciliation and which evidence permits convergence

When systems disagree, preserve the discrepancy until the relevant authority is consulted. Do not make arrival order, retries, or a generic last-write rule the accidental arbiter of business meaning.

### 8. Build the taxonomy table

Recommended shape:

| Observation or outcome | Category | Evidence/authority | Stable surface | Recovery mechanism | Business owner/consequence |
|---|---|---|---|---|---|
| response absent after charge submission | unknown outcome | payment provider; lookup pending | payment outcome unknown | reconcile using same intention | Payments keeps collection pending |

### 9. Link the taxonomy to workflows, trust boundaries, and contracts

A strong taxonomy should connect back to:
- the trust boundary where raw input becomes trusted
- the contract where neighboring contexts rely on a stable failure and uncertainty surface
- the workflow that defines intention, allowed transitions, and business consequences
- the edge policy that executes retry, backoff, lookup, or delivery

## Output checklist

- [ ] domain rejections, contract failures, confirmed operational failures, and unknown outcomes are distinct
- [ ] a timeout is not treated as proof that an external effect failed
- [ ] unexpected outcomes are not silently forced into normal paths
- [ ] detailed edge observations are translated no further than evidence permits
- [ ] retry and backoff stay at the edge while business consequences stay in the workflow
- [ ] retries preserve one business intention and its mapped idempotency key
- [ ] fact authority, reconciliation ownership, and business ownership are explicit

## Review questions

- Which reported failures are actually unknown outcomes?
- What evidence makes each operational failure confirmed?
- Are retry budget and backoff edge mechanisms aligned with named business risk?
- Does a retry preserve the same intention rather than create a fresh action?
- Can disagreement converge through a named authority and reconciliation owner?
- Would a vendor or transport change force the stable taxonomy to change?
- Can a neighboring context rely on the stable failure and uncertainty envelope?
- Are any vague categories such as `unknown error` hiding modeling work?

## Related docs

- `context/principles/05-errors-and-edge-responsibilities.md`
- `context/principles/07-type-shaped-models-and-illegal-states.md`
- `context/playbooks/05-trusted-and-untrusted-representations-playbook.md`
- `context/patterns/03-error-and-edge-translation-patterns.md`
- `context/review/05-event-and-contract-artifact-checklist.md`
- `context/playbooks/10-cross-context-contract-and-anti-corruption-playbook.md`
