class CreateSaleStatuses < ActiveRecord::Migration
  def change
    create_table :sale_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
end
