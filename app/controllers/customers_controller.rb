class CustomersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :admin_authorization, :only => [:index]


  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.page(params[:page]) #.per(10)
    # render text: Customer.all.to_xlsx and return
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
      format.csv { render text: @customers.to_csv }
      format.csv { send_data @customers.to_csv }
      format.xlsx
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    get_back_url
    @customer = Customer.includes(:next_followups).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  def get_back_url
    @location = customers_path if current_user.role_user.role.name == "Admin"
    @location = list_customers_manager_index_path if current_user.role_user.role.name == "Manager"
    @location = list_customers_employee_index_path if current_user.role_user.role.name == "Employee"
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    @location = set_location
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = current_user.customers.build(params[:customer])
    location = set_location

    respond_to do |format|
      if @customer.save
        format.html { redirect_to location, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    location = set_location
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to location, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    location = set_location

    respond_to do |format|
      format.html { redirect_to location }
      format.json { head :no_content }
    end
  end

  def next_followup
    @customer = Customer.find(params[:id])
    redirect_to customer_path(@customer) and return unless @customer.user_id == current_user.id
    if request.post?
      respond_to do |format|
        @next_followup = @customer.next_followups.build(params[:next_followup])
        if @next_followup.save
          format.html { redirect_to customer_path(@customer), notice: 'Customer was successfully updated.' }
        else
          format.html { render action: "next_followup" }
        end
      end
    end
  end

  def set_location
    location = list_customers_manager_index_path if current_user.role_user.role.name.eql?("Manager")
    location = customers_path if current_user.role_user.role.name.eql?("Admin")
    location = list_customers_employee_index_path if current_user.role_user.role.name.eql?("Employee")
    return location

  end

  private

  def admin_authorization
    redirect_to root_url unless current_user.role_user.role.name.eql?("Admin")
  end
end
