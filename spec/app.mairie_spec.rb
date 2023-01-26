require_relative '../lib/app'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))