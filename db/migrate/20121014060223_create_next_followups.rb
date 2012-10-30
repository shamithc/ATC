class CreateNextFollowups < ActiveRecord::Migration
  def change
    create_table :next_followups do |t|
      t.date :next_followup_date
      t.text :note
      t.references :customer
      t.timestamps
    end
  end
end
