
require 'pry'
require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
#puts page.class

def names_crypto(page)
  array_name = page.xpath('//tbody//td[3]/div').collect(&:text)
  #puts array_noms
end

def values_crypto(page)
  array_values = page.xpath('//tbody//td[5]/div').collect(&:text)
  #puts array_valeurs
end

def link_cryptos(names, values) # <= ici c'est des arguments
  link = names.zip(values).to_h
  #puts link
end

def perform(page)
  #noms_crypto
  link_cryptos(names_crypto(page), values_crypto(page)) #<= appelle mes defs
end

puts perform(page).inspect