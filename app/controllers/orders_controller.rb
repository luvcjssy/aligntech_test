class OrdersController < ApplicationController
  before_action :get_order, only: %w[show edit update]
  before_action :get_order_details, only: %w[show]

  def index
    @orders = Order.includes(:customer).where(nil)
    filtering_params(params).each do |key, value|
      @orders = @orders.public_send("filter_by_#{key}", value) if value.present?
    end
    @orders = @orders.order(updated_at: :desc).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      OrderMailer.with(order: @order).update_order_email.deliver_later if @order.saved_change_to_status?

      flash[:success] = 'Order has been updated!'
      redirect_to @order
    else
      render :edit
    end
  end

  private

  def get_order
    @order = Order.find(params[:id])
  end

  def get_order_details
    @order_details = @order.order_details.includes(:product)
  end

  def order_params
    params.require(:order).permit(:status)
  end

  def filtering_params(params)
    params.slice(:status, :email)
  end
end
