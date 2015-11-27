class InvoiceService

  def self.send_invoice(invoice_user_id, invoice)
    message = ''
    begin
      InvoiceMail.invoice_mail(User.find(invoice_user_id), invoice).deliver_now
      message = "Invoice: #{invoice.id} was sent"
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      message = "Invoice: #{invoice.id} not sent "
    end
    message
  end

  def self.create_download_file(invoice)
    input_file = invoice.script.script_file_url
    output_file = invoice.generate_script_url
    result = JavaService::cripty_file_job(input_file, output_file)
  end

  def self.generate_invoice_script_file(user, script)
    "#{File.basename(script.script_file_url.gsub(/.edy/, "_#{Time.now.strftime("%Y%m%d%H%M%S")}.edy"))}"
  end


end
