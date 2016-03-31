class CustomerScriptDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  #include AjaxDatatablesRails::Extensions::WillPaginate
  #include AjaxDatatablesRails::Extensions::SimplePaginator
  def_delegator :@view, :link_to
  def_delegator :@view, :link_to_if
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :disabled


  def sortable_columns
    @sortable_columns ||= ['CheckingAccount.id', 'Invoice.id','CheckingAccount.description']
  end

  def searchable_columns
    @searchable_columns ||= ['CheckingAccount.id','Invoice.id','CheckingAccount.description']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          record.invoice_id,
          record.script_id,
          record.description,
          record.value,
      ]
    end
  end

  def get_raw_records
    CheckingAccount.joins(:invoice, :script).where('invoices.user_id = ? and status = ?', params[:user_id], params[:status])
  end


end
