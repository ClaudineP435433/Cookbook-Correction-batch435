require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask User Name of Recipe
    name = @view.ask_user_for_recipe("name")
    # Ask User Description of Recipe
    description = @view.ask_user_for_recipe("description")
    # Créer une instance de recette
    recipe = Recipe.new(name, description)
    # Ajouter au cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # Display list recipes
    display_recipes
    # Ask User Recipe to delete with index
    index = @view.ask_user_for_recipe_index
    # Delete the recipe in cookbook
    @cookbook.remove_recipe(index)
  end


  private

  def display_recipes
    # Recuperer mes recettes Tableau d'Instance de Recette
    recipes = @cookbook.all
    # Afficher toutes les recettes
    @view.display_list(recipes)
  end

end
