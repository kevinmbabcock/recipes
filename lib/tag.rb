class Tag < ActiveRecord::Base
  has_many :recipe_tag
  has_many :recipes, through: :recipe_tag
end
