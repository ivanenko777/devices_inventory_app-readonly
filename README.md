# DEVICES APP

Application including CRUD operations, authentication, routing and more.

## Try it out with [Docker](https://www.docker.com/)

You need Docker installed.

    docker-compose up -d
    docker-compose run app rails db:schema:load
    docker-compose run app rails db:seed
    docker-compose down --volumes