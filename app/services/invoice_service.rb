class InvoiceService

  def send_invoice(invoice)
    message = ''
    begin
      InvoiceMail.invoice_mail(User.find(invoice.user_id), Script.find(invoice.script_id)).deliver_now
      message = "Invoice: #{invoice.id} was sent"
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      message = "Invoice: #{invoice.id} not sent "
    end
    message
  end
end
