# Building MySQL and MariaDB Docker containers

## Dumping/backing up data

```docker exec some-mariadb sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql```

```docker
docker build -t name-your-image .
$ docker run --name name-your-service \
  -p 127.0.0.1:3306:3306 -v data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=password-for-root \
  -e MYSQL_DATABASE=name-your-database \
  -e MYSQL_USER=name-your-user \
  -e MYSQL_PASSWORD=pASSword \
  name-your-image:latest
$ mysql -h 127.0.0.1 -u root -p
```

== Extending the MariaDB
If you would like to do additional initialization in an image derived from this one, add one or more *.sql, *.sql.gz, or *.sh scripts under /mariadb/docker-entrypoint-initdb.d (creating the directory if necessary). After the entrypoint calls initdb to create the default postgres user and database, it will run any *.sql files and source any *.sh scripts found in that directory to do further initialization before starting the service.

For example, to add an additional user and database, add the following to ./mariadb/docker-entrypoint-initdb.d/init-user-db.sh:

#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE docker;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL


## Trimmng the database

Using environment variables may take you just about that far:

|    Variable name       |    Description                            |
| :--------------------- | ----------------------------------------- |
|  `DB_USER`             | User name for MySQL account to be created |
|  `DB_PASSWORD`         | Password for the user account             |
|  `DB_DATABASE`         | Database name                             |
|  `DB_ROOT_PASSWORD`    | Password for the root user (optional)     |

The following environment variables influence the MySQL configuration file. They are all optional.

|    Variable name                |    Description                                                            |    Default
| :------------------------------ | --------------------------------------------------------------------------| -------------------------------
|  `MYSQL_LOWER_CASE_TABLE_NAMES` | Sets how the table names are stored and compared                          |  0
|  `MYSQL_MAX_CONNECTIONS`        | The maximum permitted number of simultaneous client connections           |  151
|  `MYSQL_MAX_ALLOWED_PACKET`     | The maximum size of one packet or any generated/intermediate string       | 200M
|  `MYSQL_FT_MIN_WORD_LEN`        | The minimum length of the word to be included in a FULLTEXT index         |  4
|  `MYSQL_FT_MAX_WORD_LEN`        | The maximum length of the word to be included in a FULLTEXT index         |  20
|  `MYSQL_AIO`                    | Controls the `innodb_use_native_aio` setting value in case the native AIO is broken. See http://help.directadmin.com/item.php?id=529 |  1
|  `MYSQL_TABLE_OPEN_CACHE`       | The number of open tables for all threads                                 |  400
|  `MYSQL_KEY_BUFFER_SIZE`        | The size of the buffer used for index blocks                              |  32M (or 10% of available memory)
|  `MYSQL_SORT_BUFFER_SIZE`       | The size of the buffer used for sorting                                   |  256K
|  `MYSQL_READ_BUFFER_SIZE`       | The size of the buffer used for a sequential scan                         |  8M (or 5% of available memory)
|  `MYSQL_INNODB_BUFFER_POOL_SIZE`| The size of the buffer pool where InnoDB caches table and index data      |  32M (or 50% of available memory)
|  `MYSQL_INNODB_LOG_FILE_SIZE`   | The size of each log file in a log group                                  |  8M (or 15% of available available)
|  `MYSQL_INNODB_LOG_BUFFER_SIZE` | The size of the buffer that InnoDB uses to write to the log files on disk | 8M (or 15% of available memory)
|  `MYSQL_DEFAULTS_FILE`          | Point to an alternative configuration file                                |  /etc/my.cnf
|  `MYSQL_BINLOG_FORMAT`          | Set sets the binlog format, supported values are `row` and `statement`    | statement
