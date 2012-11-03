class AddFieldsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :sale_status_id, :integer
    add_column :customers, :payment_type_id, :integer 
    add_column :customers, :payment_day, :text
  end
end
