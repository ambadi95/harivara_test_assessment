#!/bin/bash

curl -o allure-2.16.1.tgz -Ls https://github.com/allure-framework/allure2/releases/download/2.16.1/allure-2.16.1.tgz
tar -zxvf allure-2.16.1.tgz -C /opt/
ln -s /opt/allure-2.16.1/bin/allure /usr/bin/allure
rm -rf allure-2.16.1.tgz

sudo apt-get install wget -y
wget https://obs-community-intl.obs.ap-southeast-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz
tar -xzvf obsutil_linux_amd64.tar.gz
cd obsutil_linux_amd64_5.3.4
sudo chmod 755 obsutil
sudo ./obsutil config -e=obs.ap-southeast-3.myhuaweicloud.com -i=EGRVB8MBWGKMGJHBWI39 -k=R1kKCrYG7R6ld226OIDBbxuXwGn8TvTYDqb0Jdwd
cd /opt/allure-2.16.1/bin/
./allure generate -c /home/runner/work/CrayonPayment-fss-CrayonPaymentpay-mobileapp/CrayonPayment-fss-CrayonPaymentpay-mobileapp/reports/allure-results -o /home/runner/work/CrayonPayment-fss-CrayonPaymentpay-mobileapp/CrayonPayment-fss-CrayonPaymentpay-mobileapp/reports/allure-results-html
cd /home/runner/work/CrayonPayment-fss-CrayonPaymentpay-mobileapp/CrayonPayment-fss-CrayonPaymentpay-mobileapp/obsutil_linux_amd64_5.3.4
sudo ./obsutil cp ../reports/allure-results-html/* obs://report-automation -r -f
