require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { area: @customer.area, brand_id: @customer.brand_id, call_type_id: @customer.call_type_id, call_type_id: @customer.call_type_id, contact_no: @customer.contact_no, contacted_person: @customer.contacted_person, designation_id: @customer.designation_id, dispatch_date: @customer.dispatch_date, followup_id: @customer.followup_id, land_mark: @customer.land_mark, name: @customer.name, next_followup_date: @customer.next_followup_date, probable_bags_no: @customer.probable_bags_no, site_contact_no: @customer.site_contact_no, site_nature_id: @customer.site_nature_id, status_id: @customer.status_id, visited_location_id: @customer.visited_location_id }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    put :update, id: @customer, customer: { area: @customer.area, brand_id: @customer.brand_id, call_type_id: @customer.call_type_id, call_type_id: @customer.call_type_id, contact_no: @customer.contact_no, contacted_person: @customer.contacted_person, designation_id: @customer.designation_id, dispatch_date: @customer.dispatch_date, followup_id: @customer.followup_id, land_mark: @customer.land_mark, name: @customer.name, next_followup_date: @customer.next_followup_date, probable_bags_no: @customer.probable_bags_no, site_contact_no: @customer.site_contact_no, site_nature_id: @customer.site_nature_id, status_id: @customer.status_id, visited_location_id: @customer.visited_location_id }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
