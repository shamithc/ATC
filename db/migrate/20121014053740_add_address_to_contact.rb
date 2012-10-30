class AddAddressToContact < ActiveRecord::Migration
  def up
    add_column :customers, :address, :text
  end
  
end
