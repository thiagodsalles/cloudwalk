FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /cloudwalk
WORKDIR /cloudwalk
COPY Gemfile /cloudwalk/Gemfile
COPY Gemfile.lock /cloudwalk/Gemfile.lock
RUN bundle install
COPY . /cloudwalk

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]