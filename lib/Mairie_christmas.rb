require 'nokogiri'
require 'open-uri'
require 'pry'


page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))

