class BillsController < ApplicationController
  def index
    render json: [
      {
        name: 'Big Mac',
        taxCode: 1,
        price: 1000
      }
    ], status: :ok  
  end

  def create
    head :created
  end
end
