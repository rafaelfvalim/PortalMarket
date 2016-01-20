class InvoiceService

  def send_invoice(invoice_user_id, invoice)
    message = ''
    begin
      InvoiceMail.invoice_mail(User.find(invoice_user_id), invoice).deliver_now
      message = "Invoice: #{invoice.id} was sent"
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      message = "Invoice: #{invoice.id} not sent "
    end
    message
  end

  def create_download_file(invoice)
    input_file = invoice.script.script_file_url
    output_file = invoice.invoice_script_url
    result = JavaService.new.cripty_file_job(input_file, output_file)
  end

  def generate_invoice_script_file(user, script)
    "#{File.basename(script.script_file_url.gsub(/.edy/, "_#{Time.now.strftime("%Y%m%d%H%M%S")}.edy"))}"
  end

  def url_get_invoice_id(user_id, url_encrypt)
    secure = UtilSecurityService.new
    url = secure.decripty_url(url_encrypt, User.find(user_id))
    ivnoice = nil
    if User.exists?(user_id)
      if (Date.strptime(url['url']['date'], "%m-%d-%Y") - Date.today).to_i < Rails.configuration.download_url_days_expires
        ivnoice = Invoice.find(url['url']['invoice_id'])
      end
    end
    ivnoice
  end
end
