require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'


def get_email(url)

	page = Nokogiri::HTML open(url)

	mail = page.xpath("//div/main/section[2]/div/table/tbody/tr[4]/td[2]")

	puts mail.text

end



def extract_url_links
	
	page = Nokogiri::HTML (open('https://www.annuaire-des-mairies.com/val-d-oise.html'))

	page_link = page.xpath("//*[@class='lientxt']/@href")

	url = []

	page_link.each do |el|

		new_links = "https://www.annuaire-des-mairies.com/#{el}"

		url << new_links

	end

	return url

end



def perform

	url = extract_url_links

	url.each do |ul|

		get_email(ul)

	end

end

perform



