class SessionController < Devise::SessionsController

	def new

	end

	def create
    	resource = warden.authenticate!(auth_options)
    	# render :text => resource and return
    	set_flash_message(:notice, :signed_in) if is_navigational_format?
    	if sign_in(resource_name, resource)
    		location = admin_index_path if resource.role_user.role.name.eql?("Admin")
    		location = employee_index_path if resource.role_user.role.name.eql?("Employee")
    		location = manager_index_path if resource.role_user.role.name.eql?("Manager")

    		redirect_to location and return

    		render :text => resource.role_user.role.name and return
    		respond_with resource, :location => after_sign_in_path_for(resource)
    	end
  	end

    def create1

    end
end
