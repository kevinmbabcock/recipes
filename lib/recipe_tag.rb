class Recipe_tag < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :tag
end
