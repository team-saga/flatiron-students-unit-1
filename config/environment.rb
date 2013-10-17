require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sqlite3'


Dir.foreach('lib') do |file|
  next if file.start_with?('.')
  require_relative '../lib/""' if file.end_with?('.rb')
end

require_relative '../lib/models/student.rb'
require_relative '../lib/models/scraper.rb'


