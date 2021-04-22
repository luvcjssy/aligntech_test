require 'rails_helper'

describe OrdersController, type: :controller do
  let(:admin) { create(:admin) }

  before { sign_in admin }

  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'returns an array of accounts' do
      orders = create_list(:order, 2)
      get :index
      expect(assigns(:orders)).to eq(orders.sort{|a, b| b <=> a})
    end

    it 'return pagination' do
      create_list(:order, 20)
      get :index
      expect(assigns(:orders).map(&:id).count).to eq 15
    end

    it 'filter status' do
      create_list(:order, 2)
      create(:order, status: :to_receive)
      get :index, params: {status: :to_receive}
      expect(assigns(:orders).map(&:id).count).to eq 1
    end

    it 'filter email' do
      create_list(:order, 2)
      create(:order, order_email: 'user1@example.com')
      get :index, params: {email: 'user1'}
      expect(assigns(:orders).map(&:id).count).to eq 1
    end

    it 'filter with combine status and email' do
      create_list(:order, 2, status: :to_receive)
      create(:order, status: :to_receive, order_email: 'user1@example.com')
      get :index, params: {email: 'user1', status: :to_receive}
      expect(assigns(:orders).map(&:id).count).to eq 1
    end

    it 'filter with combine status and email return no data' do
      create_list(:order, 2, status: :to_receive)
      get :index, params: {email: 'user1', status: :to_receive}
      expect(assigns(:orders).map(&:id).count).to eq 0
    end
  end

  describe 'GET #show' do
    it 'renders the show view' do
      order = create(:order, :with_items)
      get :show, params: { id: order.id }
      expect(response).to render_template :show
    end

    it 'returns detail of order' do
      order = create(:order, :with_items)
      get :show, params: { id: order.id }
      expect(assigns(:order)).to eq(order)
    end
  end

  describe 'GET #edit' do
    it "renders the edit view" do
      order = create(:order, :with_items)
      get :edit, params: { id: order.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    let(:action) { put :update, params: { id: @order.id, order: order_attributes } }

    before :each do
      @order = create(:order, :with_items)
    end

    context 'valid attributes' do
      let(:order_attributes) { { status: :to_receive } }

      it 'located the requested @order' do
        action
        expect(assigns(:order)).to eq(@order)
      end

      it 'changes order status' do
        action
        @order.reload
        @order.status.should eq('to_receive')
      end

      it 'redirects to the updated account' do
        action
        expect(response).to redirect_to order_path(@order)
        expect(flash[:success]).to eq 'Order has been updated!'
      end
    end
  end
end