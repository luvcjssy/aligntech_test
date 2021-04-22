class OrderMailer < ApplicationMailer
  def update_order_email
    @order = params[:order]

    mail(to: @order.order_email, subject: "Your order has been updated status!")
  end
end
