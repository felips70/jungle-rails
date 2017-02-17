class UserMailer < ApplicationMailer
  default from: 'notifications@jungle.com'

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Order id: #{@order.id}")
  end
end
