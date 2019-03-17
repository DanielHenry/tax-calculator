require 'rails_helper'

RSpec.describe BillsController, type: :controller do
  context 'blank test' do
    it 'is guaranteed to be success.' do
      bills_controller = BillsController.new
    end
  end

  context 'when inserts 2 bills and get bills list' do
    it 'success get 2 bills' do
      post :create, :params => {
        :format => 'json', 
        :application => { 
          :name => "Big Mac",
          :taxCode => 1,
          :price => 1000, 
        } 
      }
      expect(response).to have_http_status(:created)      
      post :create, :params => {
        :format => 'json', 
        :application => { 
          :name => "Movie",
          :taxCode => 3,
          :price => 500, 
        } 
      }
      expect(response).to have_http_status(:created)

      get :index
      expected = [
        {
          "name" => "Big Mac",
          "taxCode" => 1,
          "price" => 1000,
        },
        {
          "name" => "Movie",
          "taxCode" => 3,
          "price" => 500,
        }
      ].to_json
      expect(response.content_type).to eq("application/json")
      expect(response.body).to eq expected
    end
  end
end
