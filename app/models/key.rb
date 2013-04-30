class Key < ActiveRecord::Base
  attr_accessible :input_value
  validates_uniqueness_of :input_value
  has_many :values, :dependent => :destroy
end
