# Adminer with Docker
This container may be used with MySQL linked containers.

# How to use
```bash
docker build -t bernardjeremy/docker-adminer .
docker run --name mysql -e MYSQL_ROOT_PASSWORD=my_password -d mysql
docker run --rm --link mysql:mysql -p 1234:80 bernardjeremy/docker-adminer
```

After these commands you'll be able to access Adminer via `http://localhost:1234` (with `mysql` as server host), press `Ctrl+C` to stop container, and it will be removed automatically (because of `--rm` option). Feel free to change `1234` to any port you like.

# Specify allowed upload file size
Sometimes it is necessary to upload big dump which doesn't fit into default limit 128M. You can specify alternative size via environment variable `UPLOAD_SIZE`:
```bash
docker run --rm --link mysql:mysql -p 1234:80 -e UPLOAD_SIZE=1G bernardjeremy/docker-adminer
```

# Thanks
Huge thanks to [nazar-pc](https://github.com/nazar-pc/) and his [docker-phpmyadmin](https://github.com/nazar-pc/docker-phpmyadmin) which is the base for this docker container
