FROM swr.ap-southeast-3.myhuaweicloud.com/CrayonPayment-jenkins-images/cirrusci/flutter:latest
RUN apt-get update && \
    apt-get install curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install nodejs && \
    npm install -g yarn && \
    yarn global add nx && \
    yarn add @nxrocks/nx-flutter --dev
ENTRYPOINT ["tail","-f","/dev/null"]