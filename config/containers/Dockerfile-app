FROM ruby:2.2


RUN apt-get update && apt-get install -y build-essential nodejs
RUN gem install bundler

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN pwd
RUN ls
RUN bundle install --jobs 10 --retry 3

COPY . ./

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
