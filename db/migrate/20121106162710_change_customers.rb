class ChangeCustomers < ActiveRecord::Migration
  def up 
   remove_column :customers, :contact_no
   remove_column :customers, :area
   remove_column :customers, :site_contact_no
   remove_column :customers, :designation_id 
   add_column :customers, :contact_no, :string
   add_column :customers, :area, :string
   add_column :customers, :site_contact_no, :string
   add_column :customers, :designation_id, :string
  end

  def down
   
  end
end
