
require 'pry'
require 'open-uri'
require 'nokogiri'

def get_townhall_email
  page_principale = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/arronville.html"))
  email = page_principale.xpath('//main/section[2]//tr[4]/td[2]').collect(&:text)
  puts email
end

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  urls = page.xpath('//tr[3]/td//td[2]//td[@width="627"]//a/@href')
  puts urls
end

def get_all_emails(array)
  
  array.map{|string| string.chr!}
  puts array
  #header.map {|h| h.to_s.prepend("http://annuaire-des-mairies.com/")}
  #for urls.each in (1...urls)
     
  #end
end


#get_townhall_email
#get_townhall_urls
#def perform (arr)
  get_all_emails
#end


#perform