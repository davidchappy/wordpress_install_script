#! /bin/bash

#### DO NOT USE REAL PASSWORDS HERE!

### EDIT THESE

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


### DEFAULTS

# File Permissions User
FILE_USER="_www"

# Base URL (sites will be setup as subdirectories)
BASE_URL="localhost"

# If username you want for wordpress is different than DB username
SITE_USER=""

# If password you want for wordpress different than DB username
SITE_PASS=""

### OPTIONAL FOR UNIQUE SETUPS

# Default Prefix (leave as empty string if you don't need this)
PREF=""

# Top Level Domain if your development setup requires it (ex: *.dev) - leave empty if doesn't.
TLD=""

# Add subfolder(s) that reside(s) under the top level folder of each site (ex: "wwwroot")
SUBFOLDER=""