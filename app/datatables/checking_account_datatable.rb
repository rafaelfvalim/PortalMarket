class CheckingAccountDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :edit_checking_account_path


  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Script.description', 'CheckingAccount.description', 'CheckingAccount.payment_date_time', 'CheckingAccount.movement_date_time']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Script.description', 'CheckingAccount.description', 'CheckingAccount.payment_date_time', 'CheckingAccount.movement_date_time']
  end

  private

  def data
    records.map do |record|
      [
          record.script.description,
          record.description,
          record.payment_date_time,
          record.movement_date_time,
          record.status,
          record.value,
          record.interest,
          record.commission,
          record.currency_id,
          link_to('Show', record, :class => 'btn btn-info btn-xs'),
          link_to('Edit', edit_checking_account_path(record), :class => 'btn btn-primary btn-xs'),
      # comma separated list of the values for each cell of a table row
      # example: record.attribute,
      ]
    end
  end

  def get_raw_records
    CheckingAccount.joins(:script).where(' checking_accounts.member_id = ?', params[:member_id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
