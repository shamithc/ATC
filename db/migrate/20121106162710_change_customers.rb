class ChangeCustomers < ActiveRecord::Migration
  def change
   remove_column :customers, :contact_no
   remove_column :customers, :area
   remove_column :customers, :site_contact_no

   add_column :customers, :contact_no, :string
   add_column :customers, :area, :string
   add_column :customers, :site_contact_no, :string
  end

  def down
  end
end
