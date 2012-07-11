# Disable stdout buffering to enable Heroku's realtime logging.
$stdout.sync = true
# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Scrapgallery::Application
