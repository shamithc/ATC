class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_authorization  


  def index
  	
  end

  def list_users
  	@users = User.all
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end


  def list_admin
  	@role_user =RoleUser.joins(:user,:role).where(role_id: 1)
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_user }
    end
  end

  def list_manager
  	@role_user =RoleUser.joins(:user,:role).where(role_id: 2)
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_user }
    end
  end

  def list_employee
  	@role_user = RoleUser.joins(:user,:role).where(role_id: 3)
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_user }
    end
  end

  def set_manager
    # render text: params[:manager_id].nil? and return
    @employee = User.find(params[:id])
    @managers = RoleUser.joins(:user,:role).where(role_id: 2)
    if request.post?
      redirect_to set_manager_admin_path and return if params[:manager_id].nil?
      @employee.manager_id = params[:manager_id]
      redirect_to list_employee_admin_index_path and return if @employee.save
    end
    # render text: @managers.to_json 
  end

# list employess under a managers 
  def list_employees_manager
    @manager = User.find(params[:id])
    @employees = @manager.employee
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
      format.xls
    end
  end
#list customers under a manager

  def list_customers_manager
    @manager = User.find(params[:id])
    @employees = @manager.employee
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  def delete_user
  	@user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to list_users_admin_index_url	 }
      format.json { head :no_content }
    end

  end

  def admin_authorization
    redirect_to root_url unless current_user.role_user.role.name.eql?("Admin")
  end


end
