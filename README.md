# Corp Keeper

A little company directory

### Development

#### Running

This application is best run with Docker Compose.

0. `docker-compose build .`
0. `docker-compose up`
0. `docker-compose run app rake db:setup`

The application should now be accessible at `localhost:3000`.

Commands can be run in the application context using
`docker-compose run app <command>`.

#### Running with a production-like environment

There's a docker-compose config provided for the app servers with the
production env behind nginx locally.  This can be used to imitate a production
environment.

Use `docker-compose -f docker-compose.production.yml up` to start
production containers locally.

### Deployment

This application is currently deployed on [hyper.sh](https://hyper.sh/).

Hyper will pull images from the registry, so they need to be pushed there first.

The current configured account is `jrforrest`, so you'll need to get those
credentials and authenticate with `docker login`. After that, build and
upload the images to the registry.

0. `docker-compose -f docker-compose.production.yml build`
0. `docker tag corpkeeper_web jrforrest/corp_keeper:web`
0. `docker tag corpkeeper_app jrforrest/corp_keeper:app`
0. `docker push corpkeeper_app:jrforrest/corp_keeper`

Hyper will now be able to pull the images, so the application can be run with
`hyper compose up -f hyper-compose.yml`.
