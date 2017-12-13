class AddIngredientsAndInstructionsToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :ingredients, :string)
    add_column(:recipes, :instructions, :string)
  end
end