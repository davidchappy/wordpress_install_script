# Wordpress Install Script
***Adapted from [https://deliciousbrains.com/automating-local-wordpress-site-setup-scripts/](https://deliciousbrains.com/automating-local-wordpress-site-setup-scripts/)***

Designed for local development, this Bash terminal script reduces the 5-minute Wordpress install to one command and adds a bonus uninstall script. (Note: this is tested on Mac El Capitán only)

To get started, download and place this project's folder in your Scripts folder (see above link if you're not sure how to start). 

**1. Install [the WP-CLI tool](http://wp-cli.org/) on your computer and make sure it runs with the "wp" command. This is also nicely covered in the article above.**

Here are the essential commands:

``` 
$ curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
$ chmod +x wp-cli.phar
$ sudo mv wp-cli.phar /usr/local/bin/wp
```

(Troubleshooting: I had a weird issue that I solved by keeping a copy of the wp-cli.phar script in the folder where I first downloaded it)

**2. Edit the items in config.sh under the "EDIT THESE" section for your environment.**

```
# Path to your local WordPress sites
SITE_PATH="/Users/$USER/Sites"

# Path to your custom Scripts folder (create if doesn't exist)
SCRIPT_PATH="/Users/$USER/Scripts/wp-install"

# Database information
DB_USER="root"
DB_PASS="root"
DB_HOST="localhost"

# Email
ADMIN_EMAIL="you@example.com"
```

**3. Check out the default and optional sections in config.sh and make any changes necessary for your environment.** The defaults should work in most cases.

**4. Note that this script does change your folder permissions (you can choose the user).** This avoids issues with Wordpress installing plugins, etc. [Learn more](https://codex.wordpress.org/Changing_File_Permissions)

**5. Run the install-wp.sh script from Terminal and be sure to include the name of the new site/database as your only argument.** The words in your site title should be separated by hyphens or underscores - no spaces.

```
install-wp new_wordpress_site
``` 

**6. The uninstall script is simple - just make sure you match the name of the site folder and database name match. **

```
uninstall-wp new_wordpress_site
``` 

**7. If you're an Alfred user, double-clicking on the included Workflow file to add both scripts.** 
From Alfred >

To install: ```wordpress name-of-site```

To uninstall: ```wp-uninstall name-of-site```


*Let me know how you like this script, and feel free to share any suggestions you have.*
