#!/usr/bin/env bash
set -euo pipefail

echo '### CoinGecko Simple Price API'
curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd' | head -c 1200
echo


echo '### Open-Meteo Forecast API'
curl -s 'https://api.open-meteo.com/v1/forecast?latitude=10.8231&longitude=106.6297&current=temperature_2m,precipitation,wind_speed_10m' | head -c 1200
echo


echo '### Hacker News Algolia Search API'
curl -s 'https://hn.algolia.com/api/v1/search?query=ai%20agents&tags=story&hitsPerPage=3' | head -c 1200
echo


echo '### Wikipedia REST Summary API'
curl -s -H 'User-Agent: sanek-agent-api-research/1.0' 'https://en.wikipedia.org/api/rest_v1/page/summary/Artificial_intelligence' | head -c 1200
echo


echo '### GitHub Public REST API'
curl -s 'https://api.github.com/repos/octocat/Hello-World' | head -c 1200
echo

