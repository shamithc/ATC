class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.string :name

      t.timestamps
    end
  end
end
