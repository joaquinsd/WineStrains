require 'rails_helper'
require 'spec_helper'

RSpec.describe WinesController, type: :controller do

  describe 'GET /index' do
    it 'returns wines correctly' do
      get :index
      expect(response).to be_successful
    end

    it 'render the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'displays wines' do
      @wines = Wine.all
      allow(Wine).to receive(:all).and_return(@wines)
      get :index
      expect(assigns(:wines)).to match_array(@wines)
    end
  end

  describe "GET /show" do
    before {
      @wine1 = Wine.create!(name: 'Test Wine')
      test_user = User.create(email:'test@test.cl', password: 123456, password_confirmation: 123456)
      sign_in(test_user, scope: :user)
    }

    it "renders the show template" do
      get :show, params: { id: @wine1.id }
      expect(response).to render_template :show
    end
  end
  
end
