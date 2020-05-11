require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'


def get_email(url)

	page = Nokogiri::HTML open(url)

	mail = page.xpath("//div/main/section[2]/div/table/tbody/tr[4]/td[2]")

	return mail

end



def get_name

	page = Nokogiri::HTML (open('https://www.annuaire-des-mairies.com/val-d-oise.html'))

	name_townhall = page.xpath("//*[@class='lientxt']")

	name_list = []

	name_townhall.each do |n_townhall|

		name_list << n_townhall.text

	end

	return name_list

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

	url.each do |url|

	mail = get_email(url)

	list = []

	list << mail.text

end

binding.pry

	name_list = get_name

		x = 0
		y = 0

		result = []

		while x < name_list.length

	result << "#{name_list[y]} ==> #{list[y]}"

			x += 1
			y += 1

			end
			
			puts result

	end

perform
