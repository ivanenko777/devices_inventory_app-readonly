# DEVICES APP

Application including CRUD operations, authentication, routing and more.

## Technologies and libraries

| Name   | Version |
|--------|---------|
| Ruby   | 2.7.2   |
| Rails  | 5.2.4   |
| MySQL  | 5.7     |
| Docker |         |

## Try it out with [Docker](https://www.docker.com/)

You need Docker installed.

    # Run app:
    docker-compose up -d
    docker-compose run app rails db:schema:load
    docker-compose run app rails db:seed

    # Stop app:
    docker-compose down --volumes