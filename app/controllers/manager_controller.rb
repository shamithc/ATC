class ManagerController < ApplicationController
  before_filter :manager_authorization


  def index
  	# render :text => current_user.role_user.role.name
  end

  def list_customers
  	# render :text =>current_user.id and return
  	@manager = current_user
    @employees = @manager.employee
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  def list_employees_manager
  	@manager = current_user
    @employees = @manager.employee
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
      format.xls
    end
  end

  def list_customers_employee
    @employee = User.find(params[:id])
  end

  private

  def manager_authorization
  	redirect_to root_url unless current_user.role_user.role.name.eql?("Manager")
  end
end
