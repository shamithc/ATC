class   SearchController < ApplicationController
  def index
  	@search = Customer.search(params[:q])  #page(params[:page]).per(3)
  	@customers = @search.result
  	@search.build_condition
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
      format.csv { render text: @customers.to_csv }
      format.csv { send_data @customers.to_csv }
      format.xlsx
    end
  end
end
