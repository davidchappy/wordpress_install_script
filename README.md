# wordpress_install_script
Fully Automated Wordpress Install Script (from Mac Terminal)

This script reduces the 5-minute Wordpress install to one command. 

***Adapted from [https://deliciousbrains.com/automating-local-wordpress-site-setup-scripts/](https://deliciousbrains.com/automating-local-wordpress-site-setup-scripts/)***

To use this script:

1. Follow the instructions at the [article](https://deliciousbrains.com/automating-local-wordpress-site-setup-scripts/) above. You'll need WP-CLI (or will have to rewrite the Wordpress download commands).

2. Edit config.sh with information that is correct for your environment (basically, some file paths, localhost path, and MySQL info).

3. Edit the last few lines of install-wp.sh:

```
wp core install...
```
Towards the end of this line are basic admin user fields that you'll want to change.

```
/usr/bin/open -a "/Applications/Google Chrome.app" $BASE_URL/$DEST
```
Just replace "Google Chrome.app" with the location of your browser of choice.

```
sudo chown -R _www $SITE_PATH/$DEST
sudo chmod -R g+w $SITE_PATH/$DEST
```
Comment these out if you don't need to modify folder permissions for WP. 

4. Run the install-wp.sh script from Terminal and be sure to include the name of the new site/database in quotes. Ex: ```install-wp "new_wordpress_site"``` 

5. Optionally, use the included Alfred Workflow. Use the keyword "wordpress" and type in the name of the new site.

Let me know how you like this script, and feel free to share any suggestions you have.
