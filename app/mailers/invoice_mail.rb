class InvoiceMail < ApplicationMailer
  default from: "klustter.codestore@gilioconsultoria.com"
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def invoice_mail(user, invoice)
    @user = user
    @invoice = invoice
    @link_to_file = "http://localhost:3000#{download_invoices_path(user_id: invoice.user_id, url: invoice.encrypt_url)}"
    mail(to: @user.email, subject: 'Klustter Code Store')
  end

end
