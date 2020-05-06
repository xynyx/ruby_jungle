# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_email
    # order = params[:order]
    # raise order.inspect
    # raise @order.inspect
    OrderMailer.order_email(Order.last, Order.last.line_items)
  end
end
