FROM ruby:2.3

RUN apt-get update
RUN apt-get install -y mysql-client
RUN mkdir /tax-calculator
COPY Gemfile /tax-calculator/Gemfile
COPY Gemfile.lock /tax-calculator/Gemfile.lock
WORKDIR /tax-calculator
RUN bundle install
COPY . /tax-calculator

# Start the main process.
CMD ["rails", "server", "-b", "127.0.0.1"]