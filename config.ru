require 'rubygems'
require 'bundler/setup'
require 'rack'
require 'sinatra'
require 'logger'
$logger = Logger.new $stdout
if development?
  $stdout.sync = true
  $logger.level = Logger::INFO
  require 'sinatra/reloader'
elsif production?
  $logger.level = Logger::WARN
end
require 'sinatra/content_for'
require 'json'
require 'haml'
require 'sass'
$:.unshift File.dirname(__FILE__)
require 'libs/cache'
require 'libs/twitter_icon'
require 'helpers/helper'
require 'controllers/main'
require 'controllers/icon'

set :haml, :escape_html => true

run Sinatra::Application
