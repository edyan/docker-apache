# iNet Process Apache Docker Image for PHP FPM
Docker Hub: https://hub.docker.com/r/inetprocess/apache


Docker container containing Apache that connects to an FPM service.

## Usage
Add the following to your docker-compose.yml, assuming that your PHP VM is named `php` (see  [inetprocess/php](https://github.com/inetprocess/docker-php)).

```yaml
apache:
    image: inet/apache:2.2
    volumes:
        - ./www:/var/www
    ports:
        - 80:80
    links:
        - php


```

## Environment variables
A variable has been created (`FPM_GID`) that will be assigned to a new group named `php`, that will be added to the  www-data group. See  [inetprocess/php](https://github.com/inetprocess/docker-php).


## Apache version
To use a specific Apache version, append the version number to the image name. For now only the 2.2 has been created.

Eg: `image: inet/apache:2.2`

The following Apache versions are available:
* Apache 2.2 (wheezy stable)
