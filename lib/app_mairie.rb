
require 'pry'
require 'open-uri'
require 'nokogiri'

PAGE = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
page_principale = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/arronville.html"))

def get_townhall_email(page_townhall)
  email = page_townhall.xpath('//main/section[2]//tr[4]/td[2]').collect(&:text)
  #puts email
end

def get_townhall_urls()
  urls_array = []
  PAGE.xpath('//tr[3]/td//td[2]//td//a/@href').each do |link|
    urls_array << link.content
  end
  urls_array.map! { |string| string.delete_prefix('.') }
  urls_array.map! {|h| h.to_s.prepend("http://annuaire-des-mairies.com")}
  #puts urls_array
end


def perform()
  townhalls_array = []
  get_townhall_urls.each do |i|
   townhalls_array << Nokogiri::HTML(URI.open(i))
  end
  townhalls_emails =[]
  townhalls_array.each do |townhalls_url|
    townhalls_emails << get_townhall_email(townhalls_url)
  end
  return townhalls_emails
end





puts perform().inspect
