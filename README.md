django-bootstrap
================

A barebones django 1.5 installation with a response-first layout based on Bootstrap 3 RC1.  

## Installation

1. Unzip or git-clone the archive into the desired directory.
2. Run the install script, which changes the directory names and python files to reflect your desired project name, and which also generates a random secret key for the settings.py file.  NOTE: as of django 1.5, the development server will not start if the secret key is empty.  Usage:

    ./install.sh &lt;new project name&gt;

3.  Start the server and navigate to the homepage, which is a django template implementation of the Bootstrap example page.  Use any of layouts in static/vendor/bootstrap-examples for a quick start.