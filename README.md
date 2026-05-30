# Research: 5 Agent-Usable No-Auth APIs

Checked: 2026-05-30T09:55:31.762180+00:00

All five APIs below were tested with curl without authentication. They are useful to AI agents because they expose structured public data that can drive research, monitoring, planning, or market context without requiring account setup.

## 1. CoinGecko Simple Price API

- Category: `crypto_prices`
- Endpoint: `https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd`
- Test status: `json_ok` / ok=True
- Why useful: Returns live crypto prices without an API key; useful for trading, treasury, bounty valuation, and market-context agents.
- Curl:

```bash
curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd'
```
- Expected useful fields: bitcoin.usd, ethereum.usd

## 2. Open-Meteo Forecast API

- Category: `weather`
- Endpoint: `https://api.open-meteo.com/v1/forecast?latitude=10.8231&longitude=106.6297&current=temperature_2m,precipitation,wind_speed_10m`
- Test status: `json_ok` / ok=True
- Why useful: No-auth weather/current conditions endpoint; useful for travel, logistics, reminders, and local planning agents.
- Curl:

```bash
curl -s 'https://api.open-meteo.com/v1/forecast?latitude=10.8231&longitude=106.6297&current=temperature_2m,precipitation,wind_speed_10m'
```
- Expected useful fields: current.temperature_2m, current.precipitation, current.wind_speed_10m

## 3. Hacker News Algolia Search API

- Category: `news_search`
- Endpoint: `https://hn.algolia.com/api/v1/search?query=ai%20agents&tags=story&hitsPerPage=3`
- Test status: `json_ok` / ok=True
- Why useful: No-auth search over Hacker News stories; useful for trend scouting, link discovery, and tech research agents.
- Curl:

```bash
curl -s 'https://hn.algolia.com/api/v1/search?query=ai%20agents&tags=story&hitsPerPage=3'
```
- Expected useful fields: hits[].title, hits[].url, hits[].points

## 4. Wikipedia REST Summary API

- Category: `encyclopedia`
- Endpoint: `https://en.wikipedia.org/api/rest_v1/page/summary/Artificial_intelligence`
- Test status: `json_ok` / ok=True
- Why useful: No-auth encyclopedia summary endpoint; useful for quick background context and citation discovery.
- Curl:

```bash
curl -s -H 'User-Agent: sanek-agent-api-research/1.0' 'https://en.wikipedia.org/api/rest_v1/page/summary/Artificial_intelligence'
```
- Expected useful fields: title, extract, content_urls.desktop.page

## 5. GitHub Public REST API

- Category: `code_repository_metadata`
- Endpoint: `https://api.github.com/repos/openclaw/openclaw`
- Test status: `json_ok` / ok=True
- Why useful: No-auth public repository metadata endpoint; useful for dependency/repo checks, release monitoring, and open-source scouting. Rate-limited but no key required for basic reads.
- Curl:

```bash
curl -s 'https://api.github.com/repos/openclaw/openclaw'
```
- Expected useful fields: full_name, stargazers_count, updated_at, html_url

## Files

- `api_list.json` — machine-readable API list, field expectations, and response previews.
- `examples.sh` — runnable curl examples.
- `README.md` — this report.

## Notes

- No API keys, cookies, OAuth flows, or private credentials are needed.
- Some APIs are rate-limited or require a polite User-Agent for production use.
- Agents should cache responses and respect provider terms/rate limits.