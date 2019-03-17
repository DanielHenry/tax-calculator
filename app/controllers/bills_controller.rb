class BillsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    bills = []
    bill = {
      'name' => 'Big Mac',
      'taxCode' => 1,
      'price' => 1000,
    }
    bills << bill
    bill = {
      'name' => 'Movie',
      'taxCode' => 3,
      'price' => 500,
    }
    bills << bill
    render json: bills, status: :ok  
  end

  def create
    head :created
  end

  def json_request?
    request.format.json?
  end
end
