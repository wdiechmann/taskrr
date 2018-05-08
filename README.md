# Taskrr.Umbrella

##  8/5/18 Project initialization
Create project
```
mix phx.new taskrr --umbrella
cd taskrr*
rm -rf apps/*
```

Add `.formatter.exs` file

```
cd apps/
mix phx.new admin --app admin
mix phx.new api --app api --no-brunch --no-html
mix phx.new aggregator --app aggregator --no-brunch --no-html
mix phx.new webhook --app webhook --no-brunch --no-html
mix phx.new jade --app jade --no-brunch --no-html
mix phx.new coral --app coral --no-brunch --no-html
```

Add `Dockerfile`, `docker-compose.yml`, and `.env` files in order to run
all services on a set of Docker Containers, then add `.env` to `.gitignore`
and then

```
docker-compose build
docker-compose up
```

Watch the elixir_1 app fail - and if the other two does not run then do
```
docker-compose up -d postgres redis
```

Then get the IP of the postgres db with

```
docker ps
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [postgres_container_id]
```

Build the database with

```
docker-compose exec postgres psql user user
CREATE DATABASE taskrr_dev;
\q
```

Now that we have our 4 apps and docker up, let’s do a little bit a configuration:

- In each app created, open the file config/dev.exs
- Change the port to 4001, 4002, 4003 and 4004 (1 port per app)
- Change the database name to the same as the .env (example: test_dev)
- If you use the Elixir docker image, change the hostname to the Postgres container IP we extracted previously. Otherwise, you can keep “localhost” or use 127.0.0.1
- Change the username and the password so they match the .env
- Now, open the config/test.exs file of each app.
- Do the same changes as you did for dev.exs. The only difference should be the range of port going from to 4101–4104 instead
- Finally, go to the root of each app, and add `.formatter.exs` which contains the following line:

```
[inputs: ["mix.exs", "{config,lib,test}/**/*.{ex,exs}"]
```

Add networks to docker-compose.yml - and use docker 'names' as opposed to IP addresses

### Change to MySQL database

Connection errors forced me to change to MySQL :( due to not knowing what is going on with the PostgreSQL, arghhhh!

```
 docker-compose exec dbserver mysql -uroot -p
```

