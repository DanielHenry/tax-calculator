require 'rails_helper'

RSpec.describe 'Bills management', type: :request do
  let(:headers) do
    {
      "CONTENT_TYPE" => "application/json",
    }
  end

  context 'when inserts 2 bills and get bills list' do
    it 'success get 2 bills' do
      post "/bills", :params => {
        :format => 'json', 
        :application => { 
          :name => "Big Mac",
          :taxCode => 1,
          :price => 1000, 
        } 
      }
      expect(response).to have_http_status(:created)      
      post "/bills", :params => {
        :format => 'json', 
        :application => { 
          :name => "Movie",
          :taxCode => 3,
          :price => 500, 
        } 
      }
      expect(response).to have_http_status(:created)

      get "/bills"
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
