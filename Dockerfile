FROM ashchan/ruby-2.1.5

EXPOSE 2300

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
Add lib /app/lib
RUN bundle

CMD ["bin/run"]
