class Recipe < ActiveRecord::Base
  has_many :recipe_tags
  has_many :ingredients
  has_many :tags, through: :recipe_tags
end
