class Value < ActiveRecord::Base
  attr_accessible :key_id, :authors, :title, :image_link
  belongs_to :key, :foreign_key => :key_id
end
