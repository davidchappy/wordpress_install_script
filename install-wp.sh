#! /bin/bash

# Includes your config file
source config.sh

if [ $# -ne 1 ]; then
    echo $0: usage: Destination Name
    exit 1
fi

DEST=$1

# Create the database.
DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
echo "Creating database $DB_NAME..."

mysql -u$DB_USER -p$DB_PASS -e"CREATE DATABASE IF NOT EXISTS $DB_NAME"

# Download WP Core.
wp core download --path=$SITE_PATH/$DEST

# Generate the wp-config.php file
wp core config --path=$SITE_PATH/$DEST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --extra-php <<PHP
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_MEMORY_LIMIT', '256M');
PHP

# Install the WordPress database.
wp core install --path=$SITE_PATH/$DEST --url=$BASE_URL/$DEST --title=$DEST --admin_user=davidchappy --admin_password=password --admin_email=davidchappy@gmail.com

# Open new Wordpress install in your browser and set permissions
/usr/bin/open -a "/Applications/Google Chrome.app" $BASE_URL/$DEST

echo "Setting folder permissions to _www...(may need to type in your system password)"
sudo chown -R _www $SITE_PATH/$DEST
sudo chmod -R g+w $SITE_PATH/$DEST