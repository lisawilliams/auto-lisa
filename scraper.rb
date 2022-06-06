# require in gems

require 'nokogiri'
require 'httparty'
require 'byebug'

# build methods

def scraper
	url = "https://www.wgbh.org/news/"
	unparsed_page = HTTParty.get(url)
	parsed_page = Nokogiri::HTML(unparsed_page.body)
	byebug
end

scraper
