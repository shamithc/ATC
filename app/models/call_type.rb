class CallType < ActiveRecord::Base
  attr_accessible :name

  has_many :customers
end
