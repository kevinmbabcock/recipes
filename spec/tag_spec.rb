require('spec_helper')

describe(Tag) do
  it("has many recipes") do
    test_recipe1 = Recipe.create({:name => "cake"})
    test_recipe2 = Recipe.create({:name => "cheese"})
    test_tag = Tag.create({:name => "cheesecake", :recipe_ids => [test_recipe1.id, test_recipe2.id]})
    expect(test_tag.recipes).to(eq([test_recipe1, test_recipe2]))
  end
end
