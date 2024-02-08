FROM ruby:3.3.0

COPY . /app
WORKDIR /app

# update
RUN apt update
RUN apt upgrade -y

# rails
RUN gem install rails

# yarn
RUN apt install ca-certificates curl gnupg -y
RUN curl -s https://deb.nodesource.com/setup_20.x | bash
RUN apt install nodejs -y
RUN npm i -g yarn

# yarn install
RUN yarn

# bundle
RUN bundle

# assets
RUN NODE_OPTIONS=--openssl-legacy-provider rails assets:precompile

# application
ENTRYPOINT ["./bin/docker-entrypoint"]
CMD /bin/sh -c "rake seed:populate && rake consumer:up"