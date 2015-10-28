class InvoiceMail < ApplicationMailer
  default from: "from@example.com"

  def invoice_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
