require 'csv'

class Cookbook

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # if row[:done] == "true"
      #   refacto_done = true
      # else
      #   refacto_done = false
      # end
      # refacto_done = row[:done] == "true" ? true : false
      row[:done] = (row[:done] == "true")
      recipe = Recipe.new(name: row[:name], description: row[:description], prep_time: row[:prep_time], done: row[:done])
      # recipe = Recipe.new(row)
      @recipes << recipe
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ["name", "description", "prep_time", "done"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?]
      end
    end
  end
end
