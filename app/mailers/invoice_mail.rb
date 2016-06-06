class InvoiceMail < ApplicationMailer
  default from: "no-reply@klustter.com.br"
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  helper ApplicationHelper
  helper PricesHelper

  def invoice_mail(user, invoice, is_preview = false)
    @user = user
    @invoice = invoice
    unless is_preview
      @link_to_file = "#{Rails.configuration.absolute_site_url}#{download_invoices_path(url: invoice.encrypt_url)}"
      @attachment_docs = AttachmentDoc.where(script_id: invoice.script_id)
    else
      @link_to_file = "dummy.com.br"
    end
    mail(to: @user.email, subject: 'KlustterScript compra de script')
  end

end
