[![Codacy Badge](https://api.codacy.com/project/badge/Grade/51dcb0e8b6c0449990085db92acfa196)](https://www.codacy.com/app/soxrepo/contao-docker-sandbox?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=soxrepo/contao-docker-sandbox&amp;utm_campaign=Badge_Grade)

# Contao docker sandbox

This is me testing out docker to create sandbox copies of existing systems for development purposes. I am completely new to Docker, so it is advised not to trust anything I am doing here. First and foremost this is a learning project.

## Goals

The following goals should be acheived by the end (This is an early list and might change as I learn things):

* [X] create a php container
* [X] create an nginx container
* [X] create an sql container
* [X] install desired contao version
* [ ] copy project files (clone from github project?)
* [ ] use sqldump to copy the database
* [ ] configure contao

## Installation

Make sure you have *docker*, *docker-compose* and *git* installed.

1. Clone the repository: `git clone https://github.com/soxrepo/contao-docker-sandbox`
2. `cd` into the directory
3. Build and start the containers with `docker-compose up -d`
4. Navigate to `localhost:8080/contao/install.php` in your browser
5. Follow the instructions

The database configuration can be looked up in `docker-compose.yml`. Enter
`mysql` in the host field.


## Tools

The following tools might come in handy:

* [Docker](https://www.docker.com/)
* [Composer](https://getcomposer.org/)
* [modman](https://github.com/colinmollenhour/modman)
* [LFS](https://git-lfs.github.com/)
