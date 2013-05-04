class Brand < ActiveRecord::Base
  attr_accessible :name

  has_many :customers
  belongs_to :item

  validates :name, :presence => true

  validates :name, :uniqueness => { :scope => :item_id, :message => "Already added brand for this " }
end
