<h1 align="center">
  <br>
  <a href="https://fossbilling.org/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/FOSSBilling/fossbilling.org/main/public/img/wordmark-white.png">
      <img alt="FOSSBilling logo" src="https://raw.githubusercontent.com/FOSSBilling/fossbilling.org/main/public/img/wordmark-black.png" height="100">
    </picture>
  </a>
  <br>
</h1>

<div align="center">

<a href="https://fossbilling.org/downloads/"><img src="https://raw.githubusercontent.com/FOSSBilling/fossbilling.org/main/public/img/gh-download-button.png" alt="Download button" width="400"/></a>

[![PHP Composer](https://github.com/fossbilling/fossbilling/actions/workflows/php.yml/badge.svg)](https://github.com/fossbilling/fossbilling/actions/workflows/php.yml)
[![Download Latest](https://img.shields.io/github/downloads/fossbilling/fossbilling/total)](https://github.com/fossbilling/fossbilling/releases/latest)
[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
[![Discord](https://img.shields.io/discord/747432407757488179?color=%237289FA&logo=discord&logoColor=%23FFF)](https://fossbilling.org/discord)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md) 
[![CodeFactor](https://www.codefactor.io/repository/github/fossbilling/fossbilling/badge)](https://www.codefactor.io/repository/github/fossbilling/fossbilling)
[![Financial Contributors](https://opencollective.com/fossbilling/tiers/badge.svg?color=brightgreen)](https://opencollective.com/fossbilling)
[![Crowdin](https://badges.crowdin.net/e/c70c78b4ab1e71424ce53dcf6bca9b12/localized.svg)](https://fossbilling.crowdin.com/fossbilling)
</div>

> **Warning**
> FOSSBilling is under active development but is currently very much beta software, there may be stability or security issues and it is not recommended for use in active production environments yet!

**FOSSBilling** is a free open-source, billing and client management solution. Whatever the size of your online services business, whether a startup or established, FOSSBilling can help you to automate your invoicing, incoming payments, and client management and communication.

If you run a web hosting business and are looking for an open-source alternative for billing and client management, then FOSSBilling is the answer. Although it is mostly used as a solution for hosting businesses, there is no reason why you can't use FOSSBilling for any other kind of online business, like digital downloads.

FOSSBilling is designed to be extensible and to integrate easily with your favorite server management software and payment gateways.

📥 This is self-hosted software that is free for anyone to install — All you need is some basic knowledge, a web server, running PHP, and a MySQL database. For more details, check the [requirements](#requirements) section.

## Example Usage

### Docker Pull
```sh
docker pull fossbilling/fossbilling
```

### Docker RUN

```sh
docker run -d fossbilling/fossbilling
```
Then, use the web interface on the Container IP to install FOSSBilling.

### Docker RUN: Port Forwarding 

```sh
docker run -d -p 80:80 fossbilling/fossbilling
```
Then, use the web interface on the Host IP to install FOSSBilling.

### Using Docker Compose

This is an example of a `docker-compose.yml` file. You should change the values to suit your needs:

```docker
version: "3.9"
services:
  fossbilling:
    image: fossbilling/fossbilling
    restart: always
    ports:
      - 80:80
    volumes:
      - fossbilling:/var/www/html
    networks:
      - front-end
      - back-end
    depends_on:
      - mysql

  mysql:
    image: mysql
    restart: always
    environment:
      MYSQL_DATABASE: fossbilling
      MYSQL_USER: fossbilling
      MYSQL_PASSWORD: fossbilling
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - mysql:/var/lib/mysql
    networks:
      - back-end

volumes:
  fossbilling:
  mysql:

networks:
  front-end: {}
  back-end: {}
```

Then, use the web interface on the Host IP to install FOSSBilling. If you used this example, the database host field in the installer should be filled with `mysql`. Other fields should be self-explanatory.

## Build your own local FOSSBilling Docker Image using FOSSBilling-docker-build.sh

```sh
# Build your own local FOSSBilling Docker Image

# based on os Install required packages using apt, yum or apk 

apt update &&

apt install wget unzip git -y &&

# Install Docker

curl -fsSL https://get.docker.com -o get-docker.sh &&

sh get-docker.sh &&

# Download or Clone FOSSBilling-Docker by Skcry

git clone https://github.com/skcry/FOSSBilling-Docker.git &&

# change into FOSSBilling-Docker directory

cd FOSSBilling-Docker &&

# create FOSSBilling Directory Then Change Directory

mkdir FOSSBilling &&

cd FOSSBilling &&

# download latest FOSSBilling Release

wget https://github.com/FOSSBilling/FOSSBilling/releases/latest/download/FOSSBilling.zip &&

# unzip FOSSBilling.zip in FOSSBilling Directory

unzip FOSSBilling.zip &&

# Remove FOSSBilling.zip

rm FOSSBilling.zip &&

# Change into tmp directory

cd .. &&

# update path-to-FOSSBilling in Dockerfile in this case /tmp/FOSSBilling using sed or any text editor

sed -i 's+path-to-fossbilling+./FOSSBilling+g' Dockerfile &&

# bulid docker image using Dockerfile

docker build -t local-fossbilling . &&

# once build completes you can use your local build FOSSBilling Docker Image

docker run -d -p 80:80 local-fossbilling &&

# clean up

cd .. &&
rm -r FOSSBilling-Docker &&
rm get-docker.sh

```

Copy FOSSBilling-docker-build.sh script on a fresh vm, update it as per your require and depending on OS change apt to yum or apk, once script runs successfully Then, use the web interface on the Host IP to install FOSSBilling.
