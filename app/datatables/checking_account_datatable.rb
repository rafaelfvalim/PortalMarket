class CheckingAccountDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :edit_checking_account_path


  def sortable_columns
      @sortable_columns ||= ['CheckingAccount.id', 'CheckingAccount.description', 'CheckingAccount.payment_date_time', 'CheckingAccount.movement_date_time', 'CheckingAccount.status', 'CheckingAccount.value', 'CheckingAccount.interest', 'CheckingAccount.commission']
  end

  def searchable_columns
    @searchable_columns ||= ['CheckingAccount.id', 'CheckingAccount.description', 'CheckingAccount.payment_date_time', 'CheckingAccount.movement_date_time', 'CheckingAccount.status', 'CheckingAccount.value', 'CheckingAccount.interest', 'CheckingAccount.commission','CheckingAccount.currency_id']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          record.invoice_id,
          record.description,
          record.payment_date_time,
          record.movement_date_time,
          record.status.humanize,
          record.value,
          record.interest,
          record.commission,
          record.currency_id,
      ]
    end
  end

  def get_raw_records
    CheckingAccount.joins(:invoice).where('invoices.user_id = ?', params[:user_id])
  end

end
