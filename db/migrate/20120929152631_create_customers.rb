class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :contact_no
      t.integer :area
      t.text :land_mark
      t.references :call_type
      t.references :status
      t.string :contacted_person
      t.integer :designation_id
      t.integer :site_contact_no
      t.references :visited_location
      t.references :brand
      t.integer :probable_bags_no
      t.date :dispatch_date
      t.references :call_type
      t.date :next_followup_date
      t.references :followup
      t.references :site_nature
      t.references :user
      t.timestamps
    end
  end
end