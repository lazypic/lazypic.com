#!/bin/sh

# GitHub API를 통해 데이터를 가져오고 jq로 파싱하여 값 추출
interest_rate=$(curl -s "https://www.alphavantage.co/query?function=FEDERAL_FUNDS_RATE&apikey=L8VRPC2M54IVT2C6" | jq -r '.data[0].value')

# index.html 파일에서 Interest Rate 값을 갱신
sed -i '' -e "s/Interest Rate: [0-9]*\.[0-9]*/Interest Rate: $interest_rate/" index.html

sudo cp index.html /usr/local/www/nginx/index.html
