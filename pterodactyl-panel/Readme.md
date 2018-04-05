# Pterodactyl Panel

Pterodactyl, a free an open source agnostic game panel... In a Container!

### Features
- Based on Alpine Linux with runit process supervisor.
- Bundled with [PHP 7][alpine-php7].
- Automatic installation using environment variables.
- system cron task running.
- Environment variables provided (see below).

### Pterodactyl environment variables

Name                                | Default value 
------------------------------------|-------------------------------------------------
APP_DEBUG                           | `false
APP_ENV                             | `production
APP_ENVIRONMENT_ONLY                | `false`
APP_KEY                             | `SomeRandomString3232RandomString`
APP_LOG                             | `daily`
APP_NAME                            | `Pterodactyl`
APP_SERVICE_AUTHOR                  | `unknown@unknown.com`
APP_THEME                           | `pterodactyl`
APP_TIMEZONE                        | `UTC`
APP_URL                             | `http://pterodactyl.example.com`
APP_CLEAR_TASKLOG                   | `720`
APP_DELETE_MINUTES                  | `10`

Name                                | Default value 
------------------------------------|-------------------------------------------------
DB_HOST                             | `db`
DB_PORT                             | `3306`
DB_DATABASE                         | `pterodactyl`
DB_USERNAME                         | `pterodactyl`
DB_PASSWORD                         | `secret`

Name                                | Default value 
------------------------------------|-------------------------------------------------
MAIL_DRIVER                         | `smtp`
MAIL_HOST                           | `mailtrap.io`
MAIL_PORT                           | `2525`
MAIL_USERNAME                       | `Pterodactyl Panel`
MAIL_PASSWORD                       | [empty]
MAIL_ENCRYPTION                     | [empty]
MAIL_FROM                           | `pterodactyl@example.com`
MAIL_FROM_NAME                      | [empty]

Name                                | Default value 
------------------------------------|-------------------------------------------------
CACHE_DRIVER                        | `file`
SESSION_DRIVER                      | `database`
QUEUE_DRIVER                        | `database`
QUEUE_HIGH                          | `high`
QUEUE_STANDARD                      | `standard`
QUEUE_LOW                           | `low`

### Php Environment variables

Name                                | Default value 
------------------------------------|-------------------------------------------------
PHP_FPM_PM                          | `ondemand`
PHP_FPM_PM_MAX_CHILDREN             | `9`
PHP_FPM_PM_PROCESS_IDLE_TIMEOUT     | `10s`
PHP_FPM_PM_MAX_REQUEST              | `200`
PHP_FPM_PM_START_SERVER             | `2`
PHP_FPM_PM_MIN_SPARE_SERVERS        | `1`
PHP_FPM_PM_MAX_SPARE_SERVERS        | `3`
PHP_FPM_PM_CLEAR_ENV                | `no`
PHP_FPM_PM_CATCH_WORKERS_OUTPUT     | `yes`
CORE_REALPATH_CACHE_SIZE            | `256K`
CORE_REALPATH_CACHE_TTL             | `600`
CORE_MEMORY_LIMIT                   | `128M`
CORE_UPLOAD_MAX_FILESIZE            | `1G`
CORE_POST_MAX_SIZE                  | `1G`
TIMEZONE                            | `UTC`
OPCACHE_ENABLE                      | `1`
OPCACHE_ENABLE_CLI                  | `0`
OPCACHE_ENABLE_MEMORY_CONSUMPTION   | `128`
OPCACHE_INTERNED_STRINGS_BUFFER     | `8`
OPCACHE_MAX_ACCELERATED_FILES       | `20000`
OPCACHE_MAX_WESTED_PERCENTAGE       | `5`
OPCACHE_USE_CWD                     | `1`
OPCACHE_VALIDATE_TIMESTAMPS         | `1`
OPCACHE_REVALIDATE_FREQ             | `60`
OPCACHE_FILE_UPDATE_PROTECTION      | `2`
OPCACHE_REVALIDATE_PATH             | `0`
OPCACHE_SAVE_COMMENTS               | `1`
OPCACHE_LOAD_COMMENTS               | `1`
OPCACHE_FAST_SHUTDOWN               | `1`

## MariaDb environment variables (When used with docker-compose)

Name                                | Default value                     | Info
------------------------------------|-----------------------------------|-------------------
MYSQL_ROOT_PASSWORD                 | [empty]                           | sets a root password
MYSQL_ALLOW_EMPTY_PASSWORD          | `false`                           | Enable empty password (true or false)
MYSQL_RANDOM_ROOT_PASSWORD          | `false`                           | Generate random root password (true or false)
MYSQL_DATABASE                      | [empty]                           | creates a database as provided by input
MYSQL_USER                          | [empty]                           | creates a user with owner permissions over said database
MYSQL_PASSWORD                      | [empty]                           | changes password of the provided user (not root)
MYSQL_DATA_DIR                      | `/var/lib/mysql/`                 | Change mysql default directory
MYSQL_STARTCMD                      | `/usr/bin/mysqld`                 | Default start command
MYSQL_STARTPARAMS                   | `--skip-host-cache --skip-name-resolve --debug-gdb` | Default start parameters
DEFAULT_CHARACTER_SET               | `utf8`
CHARACTER_SET_SERVER                | `utf8`
COLLATION_SERVER                    | `utf8_general_ci`
TIME_ZONE                           | `+00:00`
KEY_BUFFER_SIZE                     | `16M`
MAX_ALLOWED_PACKET                  | `1M`
TABLE_OPEN_CACHE                    | `64`
SORT_BUFFER_SIZE                    | `512K`
NET_BUFFER_SIZE                     | `8K`
READ_BUFFER_SIZE                    | `256K`
READ_RND_BUFFER_SIZE                | `512K`
MYISAM_SORT_BUFFER_SIZE             | `8M`
BIND_ADRESS                         | `0.0.0.0`
LOG_BIN                             | `mysql-bin`
BINLOG_FORMAT                       | `mixed`
SERVER_ID                           | `1`
INNODB_DATA_FILE_PATH               | `ibdata1:10M:autoextend`
INNODB_BUFFER_POOL_SIZE             | `16M`
INNODB_LOG_FILE_SIZE                | `5M`
INNODB_LOG_BUFFER_SIZE              | `8M`
INNODB_FLUSH_LOG_AT_TRX_COMMIT      | `1`
INNODB_LOCK_WAIT_TIMEOUT            | `50`
INNODB_USE_NATIVE_AIO               | `1`
INNODB_FILE_FORMAT                  | `Barracuda`
INNODB_FILE_PER_TABLE               | `ON`
MAX_ALLOWED_PACKET                  | `16M`
KEY_BUFFER_SIZE                     | `20M`
SORT_BUFFER_SIZE                    | `20M`
READ_BUFFER                         | `2M`
WRITE_BUFFER                        | `2M`
RETENTION_DAYS                      | `14`

### Port
- **80** 
- **443**

## The _/pterodactyl_ Volume

The pterodactyl volume for the image is used to maintain persistence:

* *pterodactyl.conf*: The .env file for laravel, automatically generated based on your environnemnt variables.
* *storage/*: Laravel storage, contains cache, logs, and files that need to be writable to the panel.
* *cache/*: configuration cache for the panel.

><small>It is recommend to create a directory mount for this, but isnt required.</small>
- **/var/www** : pterodactyl files.

### Docker-compose
Take a look at the [examples][examples]  
You will have a good examples on how to run pterodactyl with MariaDb, Redis and caddy or nginx web server.


[alpine-php7]: https://hub.docker.com/r/craftdock/alpine-php7/
[examples]: https://github.com/CraftDock/pterodactyl/tree/master/pterodactyl-panel/.example
