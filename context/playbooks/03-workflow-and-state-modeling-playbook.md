# Workflow and State Modeling Playbook

## Summary

- Model workflows as business transformations with visible triggers, decisions, and outputs.
- Make success, rejection, confirmed failure, and unknown outcome distinct where effects cross a boundary.
- Preserve business intention across retries and reconcile against named authorities.
- Separate domain decisions and consequences from edge recovery mechanisms.
- Choose test and review scope from responsibility, boundary, risk, and needed confidence.
- Use compact tables and pseudocode when they clarify the model.

## Use this when

- describing a business process
- defining allowed and forbidden state transitions
- documenting long-running or asynchronous behavior
- making invariants and failure modes explicit

## Inputs

- workflow name and purpose
- triggering inputs or events
- relevant concepts and invariants
- external dependencies and authoritative facts, if any
- business risk, deadlines, and confidence claims relevant to the workflow

## Steps

### 1. Name the workflow by business intent

Prefer names like `approve claim` or `place order` over technical labels.

### 2. Define trigger, inputs, and outputs

State:
- what starts the workflow
- what information it consumes
- what successful completion produces
- what explicit rejection or confirmed failure results may occur
- when the outcome can remain unknown

### 3. List the important decisions

Capture the decision points that change outcomes, not every implementation detail.

### 4. Describe state transitions

If states matter, document:
- current state
- triggering action or event
- resulting state
- guard condition or invariant
- side effects at the edge

### 5. Separate core from edge actions

Mark which steps are:
- core domain decisions
- external reads or writes
- emitted messages or notifications
- operational protections such as retries or timeouts

### 6. Document failures and uncertain outcomes

Classify separately:
- domain rejection
- contract or input failure
- confirmed operational failure
- unknown outcome after an external effect may have occurred
- unexpected signal in the wrong state

Record the evidence required to call a failure confirmed. A missing response alone normally supports an unknown outcome, not a failure transition.

### 7. Model waiting, authority, and reconciliation

For every business-significant external fact, name the source authoritative for that fact and the context that owns the local consequence. Add states and transitions for missing or conflicting observations. Define how reconciliation gathers evidence, who owns it, and what permits progress, compensation, escalation, or remediation.

### 8. Preserve one business intention across attempts

Give each side-effecting intention a stable domain identity and define what a duplicate means to the business. Map that identity to an idempotency key at the boundary. Reuse the mapped key within its contract scope for retries of the same intention; issue a new identity only after an explicit domain transition authorizes a new intention.

### 9. Select edge recovery policy from business constraints

First decide whether the current business intention remains eligible for another attempt. Then assign the edge owner for a bounded attempt or time budget, backoff, scheduling, and dependency protection. Derive those choices from value at stake, duplicate risk, deadlines, customer impact, and dependency limits rather than a universal number.

State what happens when the budget is exhausted. The workflow may remain unknown or move to reconciliation, escalation, compensation, or remediation; exhaustion is not itself a business rejection.

### 10. Choose evidence scope by claim

For each important behavior, state the responsibility being checked, the boundary involved, the failure or business risk, and the confidence needed. Use the narrowest scope that can observe the claim and provide that confidence:
- domain decisions and invariants through the domain surface
- parsing, translation, and idempotency-key mapping at their boundary contracts
- state/effect coordination and reconciliation across the collaborators whose interaction is the claim

Mechanical validation can check encoded shapes, transitions, and invariants. It cannot decide whether the model, authority, or business consequence is semantically right; use accountable human judgment and contrasting domain scenarios for those claims. Do not substitute a fixed test pyramid or tool list for this reasoning.

## Example transition table

| From | Trigger | Guard or evidence | To | Notes |
|---|---|---|---|---|
| pending | payment confirmed | authoritative acceptance | paid | emit confirmation at edge |
| pending | validation failed | invalid request | rejected | rejection is explicit |
| pending | response deadline elapsed | no authoritative outcome | unknown outcome | reconcile; preserve payment intention |
| unknown outcome | payment confirmed | authoritative lookup or event | paid | converge without creating a new intention |
| paid | shipping requested | inventory allocated | fulfillable | downstream action may follow |

## Example workflow skeleton

```text
Workflow: Approve Claim
Trigger: claimant submits a complete claim
Input: claim identity, policy context, supporting evidence
Output: approved claim or explicit claim rejection

Core steps:
1. verify claim eligibility
2. classify supporting evidence
3. decide approval or rejection

Edge steps:
4. persist resulting state
5. emit the claim outcome or record an unknown delivery outcome for reconciliation
```

## Review questions

- Can the workflow be understood without implementation details?
- Are states and transition guards explicit enough to review?
- Are confirmed failure and unknown outcome separate states or results?
- Does every retry preserve one business intention and its idempotency-key mapping?
- Are edge recovery mechanics separated from domain consequences?
- Are authority and reconciliation explicit where observations can disagree?
- Does each test or review scope match the responsibility and confidence claim?

## Related docs

- `context/playbooks/09-domain-error-and-failure-taxonomy-playbook.md`
- `context/principles/04-workflows-invariants-and-state.md`
- `context/principles/05-errors-and-edge-responsibilities.md`
- `context/review/02-architecture-review-checklist.md`
