# Free Crypto Price API: CoinGecko Simple Price

Checked: 2026-05-30T09:55:31.762594+00:00

## Recommendation
Use CoinGecko's public Simple Price endpoint for basic spot crypto prices without authentication.

Endpoint tested:

```text
https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd
```

Curl example:

```bash
curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd'
```

Test status: `json_ok` / ok=True

Response preview:

```json
{"bitcoin":{"usd":73510},"ethereum":{"usd":2014.34}}
```

## Why this fits the bounty

- No API key required for the tested request.
- Returns JSON that agents can parse directly.
- Supports multiple coins and quote currencies via query params.
- Good for market context, bounty valuation, wallet dashboards, and lightweight trading/research agents.

## Caveats

- Public endpoints are rate-limited; production agents should cache responses.
- For mission-critical trading, cross-check with a second source and handle downtime/429s.
