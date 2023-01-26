
require 'pry'
require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
page_principale = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/arronville.html"))

def get_townhall_email(page_principale)
  email = page_principale.xpath('//main/section[2]//tr[4]/td[2]').collect(&:text)
  #puts email
end

def get_townhall_urls(page)
  urls_array = []
  page.xpath('//tr[3]/td//td[2]//td//a/@href').each do |link|
    urls_array << link.content
  end
  urls_array.map! { |string| string.delete_prefix('.') }
  urls_array.map! {|h| h.to_s.prepend("http://annuaire-des-mairies.com")}
  #puts urls_array
end
=begin
def 
  lapin = Nokogiri::HTML(URI.open(urls_array.each))
end

def get_all_emails(array,arraybis)
  link = array.zip(arraybis).to_h
  puts link
end

def perform(page)
  get_all_emails(get_townhall_urls(page),)
end

perform
=end

get_townhall_email
get_townhall_urls(page)
