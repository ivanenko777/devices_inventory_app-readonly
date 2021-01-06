# DEVICES INVETORY APP

## Technologies and libraries

- Ruby 2.7.2
- Rails 5.2.4
  - gem [active_link_to](https://github.com/comfy/active_link_to)
  - gem [bootstrap_form](https://github.com/bootstrap-ruby/bootstrap_form)
- MySQL 5.7
- Docker 20.10.0
- Docker compose (Compose file format 3.7)

## Try it out with [Docker](https://www.docker.com/)

You need Docker installed.

    # Run app:
    docker-compose up -d
    docker-compose run app rails db:schema:load
    docker-compose run app rails db:seed

Open in browser http://localhost:3000/

    # Stop app:
    docker-compose down --volumes
