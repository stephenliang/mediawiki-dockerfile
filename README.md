# What is Mediawiki?

![MediaWiki](https://raw.githubusercontent.com/stephenliang/mediawiki-dockerfile/master/logo.png)

MediaWiki is a free and open-source wiki application, used to power wiki websites such as Wikipedia, Wiktionary and Wikimedia Commons; it was developed by the Wikimedia Foundation and others. It also runs thousands of other websites.

# How to use this image

## Start MySQL or MariaDB

To fully use MediaWiki, you will need a database as well. First follow the instructions at either the [MySQL](https://registry.hub.docker.com/_/mysql/) or [MariaDB](https://registry.hub.docker.com/_/mariadb) Docker hub pages. If you already have a MediaWiki database, you can use the existing server instead.

The at a glance command is

	docker run --name mediawiki-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql

## Running the installer

MediaWiki is configured by LocalSettings.php. If you already have one, you can skip this step. However, if you are creating your first MediaWiki instance, you can run MediaWiki which will allow you to run the installer session.

To start MediaWiki installer

	sudo docker run --link mysql:db -p 80:80 -p 443:443 -d simplyintricate/mediawiki

Then on a web browser, go to the docker host's server. For example, if you are running MediaWiki on your local computer, go to [http://localhost](http://localhost).

The installer will ask a series of questions, install MediaWiki to the database, and create a LocalSettings.php file for you. This file will be needed for the next step, so keep it handy.

## Running MediaWiki

Once you have LocalSettings.php, you can start MediaWiki and run it normally by mounting the LocalSettings to the container. You will also have to provide an image folder and extension folder so that you can upload to your Wiki and add additional extension as well.

	sudo docker run -v <path to LocalSettings.php>:/usr/share/nginx/html/LocalSettings.php:ro -v <path to images>:/usr/share/nginx/html/images -v <path to extensions>:/tmp/extensions --link mysql:db -p 80:80 -p 443:443 -d simplyintricate/mediawiki

To help maintain immutability of the container, you may extend this image to include your LocalSettings.php into your own version of MediaWiki. Here is a sample Dockerfile for that

	FROM simplyintricate/mediawiki

	ADD LocalSettings.php /usr/share/nginx/html/LocalSettings.php

## Contributing

You can help make this Dockerfile better by contributing at [Github](https://github.com/stephenliang/mediawiki-dockerfile)

If you found this Docker image helpful, send a tip via Bitcoin to 14b9y1Qw17coEkJFaAAvuXpKZLadTeBPw7
