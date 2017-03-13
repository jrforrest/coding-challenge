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
