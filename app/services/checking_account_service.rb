class CheckingAccountService

  def initialize_checking_account(invoice)
    checking_account = CheckingAccount.new
    checking_account.attributes = { description: invoice.script.description, value: invoice.value, invoice_id: invoice.id, script_id: invoice.script_id}
    checking_account.save
    checking_account.em_processamento!
  end

end