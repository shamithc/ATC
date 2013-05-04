class Item < ActiveRecord::Base
  attr_accessible :name
  has_many :brands
  validates :name, :presence => true, :uniqueness => true

end

