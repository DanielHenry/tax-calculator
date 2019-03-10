require 'rails_helper'

RSpec.describe BillsController, type: :controller do
    context 'blank test' do
        it 'is guaranteed to be success.' do
            bills_controller = BillsController.new
        end
    end
end
