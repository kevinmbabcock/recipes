class AddIngredientIdColumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :ingredient_id, :integer)
  end
end
