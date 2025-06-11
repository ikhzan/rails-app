class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  # def in_stock
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  def in_stock(product, subscriber)
    @product = product
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "#{@product.name} is back in stock!")
  end


  # def in_stock
  #   product = Product.find(params[:product_id])
  #   subscriber = Subscriber.find(params[:subscriber_id])
  #   mail(to: subscriber.email, subject: "#{product.name} is back in stock!")
  # end

end
