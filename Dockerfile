FROM ruby:2.6.3-alpine

WORKDIR /app

ADD . /app

RUN gem install bundler && \
    bundle

CMD ["./run.sh"]

