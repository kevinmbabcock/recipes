require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ("/") do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all
  erb(:recipes)
end

post("/recipes") do
  name = params[:recipe_name]
  Recipe.create({:name => name})
  redirect('/recipes')
end

get("/recipes/:id") do
  @recipe = Recipe.find(params[:id].to_i)
  @ingredients = Ingredient.all
  @tags = Tag.all
  erb(:recipe)
end

patch("/recipes/:id") do
  @recipe = Recipe.find(params[:id].to_i)
  @ingredients = Ingredient.all
  @tags = Tag.all
  ingredient_ids = params[:ingredient_ids]
  if ingredient_ids
    @recipe.ingredients.each do |ingredient|
      ingredient_ids.push(ingredient.id)
    end
  end
  tag_ids = params[:tag_ids]
  if tag_ids
    @recipe.tags.each do |tag|
      tag_ids.push(tag.id)
    end
  end
  @recipe.update({:ingredient_ids => ingredient_ids, :tag_ids => tag_ids})
  erb(:recipe)
end

get("/recipes/:id/edit") do
  @recipe = Recipe.find(params[:id])
  @ingredients = Ingredient.all
  @tags = Tag.all
  erb(:recipe_edit)
end

patch("/recipes/:id/edit") do
  name = params.fetch("name")
  @recipe = Recipe.find(params[:id].to_i)
  @recipe.update({:name => name})
  @ingredients = Ingredient.all
  @tags = Tag.all
  erb(:recipe)
end

get("/tags") do
  @tags = Tag.all
  erb(:tags)
end

post("/tags") do
  name = params[:tag_name]
  Tag.create({:name => name})
  redirect('/tags')
end

get("/tags/:id") do
  @tag = Tag.find(params[:id].to_i)
  erb(:tag)
end

get("/ingredients") do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

post("/ingredients") do
  name = params[:ingredient_name]
  Ingredient.create({:name => name})
  redirect('/ingredients')
end

get("/ingredients/:id") do
  @ingredient = Ingredient.find(params[:id].to_i)
  erb(:ingredient)
end
