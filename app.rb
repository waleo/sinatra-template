require "sinatra"
require "sinatra/base"
require "sinatra/reloader"
require "sinatra/activerecord"
require "active_record"
require "uri"
require "bundler/setup"
require "logger"
require "yaml"

# App
#require helpers.rb
#require models.rb

dbconfig = YAML.load(File.read("config/database.yml"))
RACK_ENV ||= ENV["RACK_ENV"] || "development"
PER_PAGE = 6
ActiveRecord::Base.establish_connection dbconfig[RACK_ENV]
Dir.mkdir('log') if !File.exists?('log') || !File.directory?('log')
ActiveRecord::Base.logger = Logger.new(File.open("log/#{RACK_ENV}.log", "a+"))