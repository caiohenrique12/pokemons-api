FROM ruby:2.7.5

WORKDIR /pokemons-api

COPY Gemfile /pokemons-api/Gemfile
COPY Gemfile.lock /pokemons-api/Gemfile.lock

RUN bundle install

COPY . /pokemons-api

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
