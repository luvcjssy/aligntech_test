require 'rails_helper'

describe ProductsController, type: :controller do
  let(:admin) { create(:admin) }


  before { sign_in admin }

  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'returns an array of products' do
      products = create_list(:product, 5)
      get :index

      expect(assigns(:products)).to eq(products)
    end
  end
end