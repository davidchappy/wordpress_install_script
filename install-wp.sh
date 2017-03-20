#! /bin/bash

# Include your config file
source config.sh

# Get command line args and set DEST to provided arg
if [ $# -ne 1 ]; then
    echo $0: usage: Destination Name
    exit 1
fi
DEST=$1

# Check config for and add a hyphenated site name prefix 
if [ $PREF != "" ]
then
  DEST=$PREF-$DEST
else 
  DEST=$DEST
fi

# Create local site directory
mkdir $SITE_PATH/$DEST

# Insert subfolder if provided in config.sh
if [ $SUBFOLDER != "" ]
then
  mkdir $SITE_PATH/$DEST/$SUBFOLDER
  FULL_DEST=$DEST/$SUBFOLDER
else 
  FULL_DEST=$DEST
fi

# Set permissions on folder - default is _www per Wordpress; change in config.php
echo "Setting folder permissions... (may need to type in your system password)"
sudo chown -R $FILE_USER $SITE_PATH/$FULL_DEST
sudo chmod -R g+w $SITE_PATH/$FULL_DEST

# Create the database.
DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
echo "Creating database $DB_NAME..."

mysql -u$DB_USER -p$DB_PASS -e"CREATE DATABASE IF NOT EXISTS $DB_NAME"

# Download WP Core.
wp core download --path=$SITE_PATH/$FULL_DEST

# Generate the wp-config.php file
wp core config --path=$SITE_PATH/$FULL_DEST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --extra-php <<PHP
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_MEMORY_LIMIT', '256M');
PHP

# Check for and add a top-level-domain
if [ $TLD != "" ]
then
  DEST_URL=$DEST.$TLD
else 
  DEST_URL=$DEST
fi

# If different site/admin user/pass provided
if [ $SITE_USER = "" ]
then
  SITE_USER=$DB_USER
fi
  
if [ $SITE_PASS = "" ]
then
  SITE_PASS=$DB_PASS
fi

# Install core WordPress
wp core install --path=$SITE_PATH/$FULL_DEST --url=$DEST_URL --title=$DEST --admin_user=$SITE_USER --admin_password=$SITE_PASS --admin_email=$ADMIN_EMAIL

# Open new Wordpress install in your browser and set permissions
/usr/bin/open -a "/Applications/Google Chrome.app" "http://$DEST_URL"