# ./Dockerfile
# base image Elixir to start with
FROM elixir:1.6

# install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# install the latest Phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# install NodeJS and NPM
RUN curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

# create our app folder and copy our code in it
RUN mkdir /app
COPY . /app
WORKDIR /app

# install dependencies
RUN mix deps.get
RUN mix deps.compile

# We run multiples as on to install the node modules and brunch them.
# We can't separate them as each command crate a temporary container which use the defined seting (WORKDIR, etc.)
RUN cd apps/admin/assets && npm install && node node_modules/brunch/bin/brunch build && cd ../ && mix phx.digest

# run phoenix server
# CMD mix phx.server