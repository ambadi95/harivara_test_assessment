#!/bin/bash
curl -sX GET  "https://api.appcenter.ms/v0.1/apps/CrayonPayment-PAY/CrayonPayment-PAY-Customer-Debug/releases/latest" \
-H "Content-Type: application/json" \
-H "X-Api-Token: 2ba3493b514932eee913a8e64106118d10931565" >> output.json

