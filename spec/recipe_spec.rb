require('spec_helper')

describe(Recipe) do
  it("has many tags") do
    test_tag = Tag.create({:name => "cake"})
    test_tag1 = Tag.create({:name => "cheese"})
    test_recipe = Recipe.create({:name => "cheesecake", :tag_ids => [test_tag.id, test_tag1.id]})
    expect(test_recipe.tags).to(eq([test_tag, test_tag1]))
  end
  # it("has many ingredients") do
  #
  # end
end
