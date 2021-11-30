# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require 'sidekiq/web'
require 'sidekiq/api'
require 'sidekiq-statistic'

run Rails.application
Rails.application.load_server
