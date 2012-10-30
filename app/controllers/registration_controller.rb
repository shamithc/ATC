class RegistrationController < Devise::RegistrationsController
    before_filter :before_signup, :only =>["new"]


  def new
    super
  end
  
  def create
    
    build_resource
    # render :text => params and return

    if resource.save
      resource.create_role_user(role_id: resource.role_id)
      respond_with resource, :location => root_path
      # if resource.active_for_authentication?
      #   set_flash_message :notice, :signed_up if is_navigational_format?
      #   sign_in(resource_name, resource)
      #   respond_with resource, :location => after_sign_up_path_for(resource)
      # else
      #   set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
      #   expire_session_data_after_sign_in!
      #   respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      # end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


private

  def before_signup
    # redirect_to root_url and return  unless current_user
    # redirect_to root_url and return  unless current_user.role_user.role.name.eql?("Admin")
  end
  

end
