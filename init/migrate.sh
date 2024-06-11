#!/bin/bash

export dev_url=http://localhost/

echo "Granting WordPress user privileges..."

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
";

echo "Migrating WordPress URL..."

mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE -e "
UPDATE ${MYSQL_DATABASE}.${WORDPRESS_TABLE_PREFIX}options SET option_value = REPLACE(option_value, '${PRODUCTION_URL}', '${dev_url}') WHERE option_name = 'home' OR option_name = 'siteurl';
"

echo "Migration done!"
