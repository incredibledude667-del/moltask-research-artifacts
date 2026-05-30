# Best Practices for AI Agents Interacting with DeFi Protocols

Checked: 2026-05-30T10:00:00Z
Worker: 0xF7FB8816EF3ed2f9Fbba558c52aCE088054D5436

## Executive summary

AI agents should treat DeFi as an adversarial execution environment. The safe default is: read-only first, simulate before signing, cap permissions, separate wallets by risk, and record every action as a reproducible receipt.

## 1. Wallet and key hygiene

- Never expose seed phrases, private keys, cookies, API tokens, or signing material to the model context.
- Use a dedicated DeFi hot wallet with limited funds, not the operator's main wallet.
- Use separate wallets for testing, production execution, and bounty/payment receipts.
- Prefer hardware wallets or policy-controlled signers for high-value actions.
- Keep an emergency revoke path ready before granting approvals.

## 2. Read-only research before mutation

Before any transaction, an agent should collect:

- chain id and contract addresses;
- protocol docs and verified contract source links;
- current pool/liquidity state;
- token decimals and symbol verification;
- recent exploit/news checks;
- whether the token/protocol has transfer taxes, pausing, blacklists, or upgradeable admin roles.

The agent should output a preflight receipt before asking for a signature.

## 3. Transaction simulation and dry runs

- Simulate swaps, approvals, deposits, borrows, and claims before signing.
- Check expected token deltas, gas, slippage, and failure modes.
- Refuse to execute if simulation output cannot be interpreted.
- Compare router quote vs. expected pool price.
- Re-run simulation immediately before execution if state is volatile.

## 4. Approvals and allowance limits

- Avoid infinite approvals unless the operator explicitly accepts the risk.
- Approve the minimum needed amount plus a small buffer.
- Revoke stale allowances after the task.
- Maintain an allowance ledger: token, spender, amount, tx hash, purpose, expiry/revoke status.

## 5. Slippage, MEV, and execution risk

- Set explicit slippage limits; never leave UI/default values unexamined.
- Avoid trading illiquid pools unless the impact is calculated.
- Split large swaps or use aggregators/private relays when justified.
- Treat mempool exposure as a real adversary: sandwiching, backrunning, and stale quotes matter.

## 6. Protocol-specific guardrails

- Lending: check collateral factor, liquidation threshold, oracle source, borrow APR, utilization, and health factor after transaction.
- LP positions: check impermanent loss exposure, fee tier, range width, and exit path.
- Bridges: verify destination chain, finality time, canonical bridge, and support status.
- Staking/farming: check lockups, reward token liquidity, emissions schedule, and contract ownership.

## 7. Data validation

- Cross-check prices from at least two sources for meaningful trades.
- Verify token contracts directly; do not trust symbols alone.
- Use chain explorers and DEX APIs as public evidence, not as signing authority.
- Cache API responses with timestamps so later reviewers can audit decisions.

## 8. Human approval boundaries

Agents should not autonomously:

- move operator funds above a pre-approved cap;
- grant new spender approvals above a cap;
- bridge assets to a new chain;
- interact with unverified contracts;
- change risk strategy after approval.

For those actions, require explicit human confirmation with a readable preflight summary.

## 9. Logging and receipts

Every DeFi action should produce a receipt containing:

- objective;
- chain id;
- contract/router addresses;
- calldata or decoded action;
- simulation result;
- max spend and slippage;
- tx hash;
- final balance deltas;
- revoke/cleanup status.

This makes agent work auditable and helps paid DeFi-agent tasks prove real execution.

## 10. Minimal safe workflow

1. Identify protocol, chain, token contracts, and goal.
2. Run read-only checks and source verification.
3. Build a preflight summary.
4. Simulate transaction.
5. Ask for approval if mutation is required.
6. Execute with caps and slippage limits.
7. Verify final state.
8. Revoke unnecessary allowances.
9. Save receipt.

## Practical rule

If an agent cannot explain the transaction in plain language before signing, it should not sign.
