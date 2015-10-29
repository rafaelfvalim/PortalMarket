class InvoiceMail < ApplicationMailer
  default from: "klustter.codestore@gilioconsultoria.com"

  def invoice_mail(user, script)
    @user = user
    @script = script
    mail(to: @user.email, subject: 'Klustter Code Store')
  end

end
