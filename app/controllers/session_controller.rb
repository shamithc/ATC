class SessionController < Devise::SessionsController

	def create
    	resource = warden.authenticate!(auth_options)
    	render :text => resource and return
    	set_flash_message(:notice, :signed_in) if is_navigational_format?
    	sign_in(resource_name, resource)
    	respond_with resource, :location => after_sign_in_path_for(resource)
  	end
end
