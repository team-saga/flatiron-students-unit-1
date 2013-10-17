require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sqlite3'
require 'faker'

Dir.foreach('lib') do |file|
  next if file.start_with?('.')
  require_relative '../lib/""' if file.end_with?('.rb')
end
require_relative '../lib/models/scraper'
require_relative '../lib/models/student'
