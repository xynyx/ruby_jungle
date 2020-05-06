class OrderMailer < ApplicationMailer

  def order_email(order, enhanced_cart)
    @order = order
    @items = @order.line_items
    # raise @items.inspect
    mail(to: @order.email, subject: "Order##{@order.id}")
  end
end
