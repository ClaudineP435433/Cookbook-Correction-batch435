require_relative 'recipe'
require_relative 'cookbook'


csv_file   = File.join(__dir__, 'recipes.csv')
flan = Recipe.new("Flan","Caramel Beurre Salé")
charlotte = Recipe.new("Charlotte","Vanille Fraise Framboise")
book = Cookbook.new(csv_file)
book.add_recipe(flan)
book.add_recipe(charlotte)

p book
