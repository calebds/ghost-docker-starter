# ghost-docker-starter

A starter project for developing and deploying Ghost themes with Docker.

__Features:__

1. Ability to publish Ghost theme as an NPM package
- Deploy as a Docker container based on Ghost image
- Blog config file checked into source
- Develop in a Docker container based on Ghost image
- Live code reloading during theme development
- Persistent development instances of Ghost blogs

Full article with more details here: http://paislee.io/how-to-develop-ghost-themes-with-docker.

## Getting started

1. Clone this repo
2. [Install Docker](https://docs.docker.com/engine/installation/)
3. Modify config.js as per [Ghost documentation](http://support.ghost.org/config/)
4. Update package.json to name your blog
5. Update scripts/build.sh, scripts/development.sh, and scripts/upgrade.sh to name your Docker images

## Build the image

    $ ./scripts/build.sh

## Run in development mode

    $ ./scripts/development.sh

## Upgrade production image

    $ ./scripts/upgrade.sh
