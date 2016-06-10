# Preview all emails at http://localhost:3000/rails/mailers/invoice_mail
class InvoiceMailPreview < ActionMailer::Preview
  def send
    InvoiceMail.invoice_mail(User.find(1), Invoice.find(1))
  end
end
