class InvoiceMail < ApplicationMailer
  default from: "klustter.codestore@gilioconsultoria.com"
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def invoice_mail(user, invoice)
    @user = user
    @invoice = invoice
    @link_to_file = "#{Rails.configuration.absolute_site_url}#{download_invoices_path(url: invoice.encrypt_url)}"
    mail(to: @user.email, subject: 'Klustter Code Store')
  end

end
