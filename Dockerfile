FROM lambci/lambda:build-nodejs8.10
LABEL maintainer="Juwita Winadwiastuti <juwita.winadwiastuti@hara.ag>"

# Add package.json before rest of repo for caching
ADD package.json /app/
WORKDIR /app
ADD . /app

RUN npm install --no-cache

RUN npm install -g serverless@1.28.0
RUN npm link nodemon
RUN npm install -g mocha-junit-reporter mocha-multi-reporters