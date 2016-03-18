# Be sure to restart your server when you modify this file.

# My application specific configurations
# In form of:
# MyApp::Application.config.x.<KEY_NAME> = <VALUE_NAME>
#

# Note the alias below, bad practice but saves typing. However, lets us change
# Config to a Model or to session store.
Config = Blocmetrics::Application.config.x

# General
Config.log_level = '' # :debug

# Views - General
Config.link_refresh = true
