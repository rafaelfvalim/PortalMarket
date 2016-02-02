user = User.find(1)
invoice = user.invoice[0]
is_preview = true

Maily.hooks_for('InvoiceMail') do |mailer|
  mailer.register_hook(:invoice_mail, user, invoice, is_preview)
end

Maily.hooks_for('ApplicationMailer') do |mailer|
end
