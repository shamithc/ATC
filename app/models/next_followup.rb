class NextFollowup < ActiveRecord::Base
  attr_accessible :next_followup_date, :note
  validates :next_followup_date, :note, :presence => true

  belongs_to :customer
end
