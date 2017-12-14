require('spec_helper')

describe(Ingredient) do
  it("belongs to a recipe") do
    test_recipe = Recipe.create({:name => "cheesecake"})
    test_recipe2 = Recipe.create({:name => "cookies"})
    new_ingredient1 = Ingredient.create({:name => "flour", :recipe_ids => [test_recipe.id, test_recipe2.id]})
    expect(new_ingredient1.recipes).to(eq([test_recipe, test_recipe2]))
  end
end
