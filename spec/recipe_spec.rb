require('spec_helper')

describe(Recipe) do
  it("has many tags") do
    test_tag = Tag.create({:name => "cake"})
    test_tag1 = Tag.create({:name => "cheese"})
    test_recipe = Recipe.create({:name => "cheesecake", :tag_ids => [test_tag.id, test_tag1.id]})
    expect(test_recipe.tags).to(eq([test_tag, test_tag1]))
  end
  it("has many ingredients") do
    test_ingredient1 = Ingredient.create({:name => "flour"})
    test_ingredient2 = Ingredient.create({:name => "sugar"})
    test_recipe = Recipe.create({:name => "cheesecake", :ingredient_ids => [test_ingredient1.id, test_ingredient2.id]})
    expect(test_recipe.ingredients).to(eq([test_ingredient1, test_ingredient2]))
  end
end
