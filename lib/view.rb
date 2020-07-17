class View
  def display_list(recipes)
    # recipes => Array Instance de Recette
    recipes.each_with_index do |recipe,index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_recipe(element)
    puts "What is the #{element} of the recipe ?"
    return gets.chomp
  end

  def ask_user_for_recipe_index
    puts "What is the id of the recipe you want to delete ?"
    return gets.chomp.to_i - 1
  end
end
