class CreateRecipeIngredient < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipe_ingredients) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
      t.timestamps
    end
  end
end
