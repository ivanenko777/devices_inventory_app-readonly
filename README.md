# DEVICES APP

Application including CRUD operations, authentication, routing and more.

## Technologies and libraries

| Name   | Version |
|--------|---------|
| Ruby   | 2.7.2   |
| Rails  | 5.2.4   |
| gem [active_link_to](https://github.com/comfy/active_link_to) | 1.0.5 |
| gem [bootstrap_form](https://github.com/bootstrap-ruby/bootstrap_form) | 4.5.0 |
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