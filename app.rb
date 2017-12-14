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
