class EmployeeController < ApplicationController 
  before_filter :authenticate_user!

  def index
  end

  def list_customers
  	@employee = current_user
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end

  end
end
