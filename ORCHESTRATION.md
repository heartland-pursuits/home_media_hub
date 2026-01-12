# AI Orchestration Playbook

## Task Delegation Framework

### When to Delegate

**Use Gemini (Builder):**
- Script creation
- Configuration file generation
- Automation code
- File operations

**Use Grok (Validator):**
- Testing and verification
- Debugging and diagnostics
- Security checks
- Error detection and fixing

**Use Claude (Orchestrator):**
- Strategic planning
- Documentation
- User communication
- Multi-step workflow coordination

### Standard Task Template

```markdown
### Task ID: YYYY-MM-DD-NNN
**Assigned To:** [Agent Name]
**Status:** PENDING
**Priority:** [HIGH/MEDIUM/LOW]
**Delegated By:** [User/Claude]
**Delegated At:** [Timestamp]

**Context:**
[Brief background]

**Objective:**
[Clear goal]

**Requirements:**
- [Req 1]
- [Req 2]

**Expected Output:**
- [Output 1]
- [Output 2]

**Verification Criteria:**
- [ ] Criteria 1
- [ ] Criteria 2

**Constraints:**
- [Constraint 1]
- Update handoff.md with results (MAX 100 WORDS)
- Update token_usage_tracker.md
```

### Response Constraints

**CRITICAL: All worker agents (Gemini, Grok) must:**
- MAX 100 WORDS in completion response
- Update handoff.md with results
- Update token_usage_tracker.md
- Provide full command output (no summaries)

### Fix Authorization

Grok is AUTHORIZED to fix errors immediately:
- Syntax errors → Fix and document
- Permission issues → Correct and document
- Missing dependencies → Install and document
- Logic errors → Fix and document

**Only escalate if:** Architectural decision or user preference needed
