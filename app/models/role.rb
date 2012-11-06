class Role < ActiveRecord::Base
  attr_accessible :name

  has_one :role_user

# To get virtual name
  def virtual_role
  	return "Admin" if name == 'Admin'
  	return "Manager" if name == 'Manager'
  	return "SuperVisor" if name == 'Employee'
  end

end
