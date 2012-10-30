class Customer < ActiveRecord::Base
  acts_as_xlsx
  attr_accessible :area, :brand_id, :call_type_id, :call_type_id, :contact_no, :contacted_person, :designation_id, :dispatch_date, :followup_id, :land_mark, :name, :next_followup_date, :probable_bags_no, :site_contact_no, :site_nature_id, :status_id, :visited_location_id,:address
  validates :area, :brand_id, :call_type_id,:contact_no, :contacted_person, :designation_id, :dispatch_date, :followup_id, :land_mark, :name, :next_followup_date, :probable_bags_no, :site_contact_no, :site_nature_id, :status_id, :visited_location_id, :presence => true

  # acts_as_xlsx


  belongs_to :brand
  belongs_to :call_type
  belongs_to :followup
  has_many   :next_followups
  belongs_to :site_nature
  belongs_to :status
  belongs_to :visited_location
  belongs_to :user


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['a','b']
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
