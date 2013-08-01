#!/bin/bash
# This script replaces strings in the <project name>/settings.py file to reflect a new project name,
# renames the project directory, and creates a new secret key.

if (( $# != 1 )); then
  echo "usage: install.sh <project name>"
  exit
fi

old_project_name=djangobootstrap
new_project_name=$1
date_format=`date +%Y-%m-%d`
backup_extension=".$date_format.backup"
secret_key=`python -c 'import random; print "".join([random.choice("abcdefghijklmnopqrstuvwxyz0123456789!@#$%^*(-_=+)") for i in range(50)])'`

echo "Installing project as '$1'"

mkdir -p backup

# Rename project directory
mv $old_project_name $new_project_name

# Install new secret key
find . -name "settings.py" -exec sed -i.secret_key$backup_extension "s/SECRET_KEY = ''/SECRET_KEY = '$secret_key'/" {} +

# Replace all instances of previous project name
find . -name "*.py" -exec sed -i$backup_extension "s/$old_project_name/$new_project_name/g" {} \;

# Move backups of edited files to backup directory 
find . -name "*$backup_extension" -exec mv {} backup \; &> /dev/null

echo "Backing up files to ./backup"
echo "Done!"