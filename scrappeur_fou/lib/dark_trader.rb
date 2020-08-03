require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/" #page source

#methode pour avoir chaque symbole
def all_coin_symbols(page)
  page.xpath("//tr/td[3]/div").map {|name| name.text}
end

#valeur des size
def all_coin_values(page)
page.xpath("//tr/td[5]/a").map {|value| value.text.delete("$,")}
end

#ensemble des 2 fonctions pour obtenir un array de symbole avec les valeurs correspondants
def perform
  page = Nokogiri::HTML(open(PAGE_URL))   
  results = Hash.new
  results = all_coin_symbols(page).zip(all_coin_values(page))
  results.map {|result| {result[0] => result[1]}}
end

puts perform

