# require in gems

require 'nokogiri'
require 'httparty'
require 'byebug'

# build methods

def scraper
	url = "https://careers.journalists.org/jobs/"
	unparsed_page = HTTParty.get(url)
	parsed_page = Nokogiri::HTML(unparsed_page.body)

	# variable to store all the job listings on the page we grabbed above
	job_listings = parsed_page.css('div.bti-job-search-results') #25 jobs
	#array to store individual jobs
	jobs = Array.new

	#now iterate through the individual listings
	job_listings.each do |job_listing|

		job = {
			title: job_listing.css('div.card-title').text,
			company: job_listing.css('div.card-subtitle').text,
			location: job_listing.css('p.card-text').text,
			url: job_listing.css('id[data-job-path]')
		}
		
		jobs << job

	 
	end	

	byebug

end

scraper
