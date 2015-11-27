class InvoiceMail < ApplicationMailer
  default from: "klustter.codestore@gilioconsultoria.com"

  def invoice_mail(user, invoice)
    @user = user
    @invoice = invoice
    mail(to: @user.email, subject: 'Klustter Code Store')
  end

end
