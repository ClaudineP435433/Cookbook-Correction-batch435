require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

ingredient = 'chocolate'
url = "https://www.bbcgoodfood.com/search/recipes?query=#{ingredient}"

ideas = []
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('#search-results article').first(5).each do |element|
  name = element.search('.teaser-item__title').text.strip
  description = element.search('.field-items .field-item').text.strip
  ideas << Recipe.new(name, description)
end
 p ideas

# => ideas = [ Instance de recettes ]
