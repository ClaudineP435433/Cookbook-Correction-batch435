class View
  def display_list(recipes)
    # recipes => Array Instance de Recette
    recipes.each_with_index do |recipe,index|
      done = recipe.done? ? "[X]" : "[ ]"
      puts "#{index + 1} #{done} - #{recipe.name} - #{recipe.prep_time}"
    end
  end

  def ask_user_for_recipe(element)
    puts "What is the #{element} of the recipe ?"
    return gets.chomp
  end

  def ask_user_for_recipe_index
    puts "What is the id of the recipe you choose ?"
    return gets.chomp.to_i - 1
  end

  def ask_user_for_keyword
    puts "What is the keyword you are looking for ?"
    return gets.chomp
  end
end
