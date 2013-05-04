class AddItemToCustomer < ActiveRecord::Migration
  def change
  	add_column :customers, :item_id, :integer
  end
end
