class CreateVisitedLocations < ActiveRecord::Migration
  def change
    create_table :visited_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
