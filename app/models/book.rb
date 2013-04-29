class Book < ActiveRecord::Base
  attr_accessible :authors, :title, :image_link
end
