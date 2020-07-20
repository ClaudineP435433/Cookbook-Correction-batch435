require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}"
    ideas = []
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('#search-results article').first(5).each do |element|
      name = element.search('.teaser-item__title').text.strip
      description = element.search('.field-items .field-item').text.strip
      prep_time = element.search('.teaser-item__info-item--total-time .mins').text.strip
      ideas << Recipe.new(name: name, description: description, prep_time: prep_time)
    end
    return ideas
    # => ideas
  end
end




