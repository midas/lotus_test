FROM ashchan/ruby-2.1.5

EXPOSE 2300

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /application
WORKDIR /application
ADD . /application

VOLUME /application

RUN bundle install

CMD ["bundle", "exec", "lotus", "server", "--port=2300", "--host=0.0.0.0"]
