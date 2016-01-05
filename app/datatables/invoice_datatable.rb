class InvoiceDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :edit_checking_account_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= [
        'Invoice.id',
        'User.name',
        'Invoice.script_id',
        'Script.name',
        'Script.platform',
        'Workplace.organization_name',
        'Workplace.system_number',
        'Invoice.value',
        'Invoice.shipped_to',
        'Invoice.created_at',
    ]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Invoice.id', 'Member.member_name', 'Invoice.script_id', 'Script.name', 'Script.platform', 'Workplace.organization_name', 'Workplace.system_number', 'Invoice.value', 'Invoice.shipped_to', 'Invoice.created_at',]
  end

  private

  def data
    records.map do |record|
      [
          link_to(record.id, record),
          link_to(record.user.full_name, record.user),
          link_to(record.script.id, record.script),
          record.script.name,
          record.script.platform,
          record.workplace.organization_name,
          record.workplace.system_number,
          record.value,
          record.shipped_to,
          record.created_at.strftime("%d/%m/%Y %I:%M %p"),
      ]
    end
  end

  def get_raw_records
    Invoice.joins(:script, :user, :member, :workplace).all
  end

end
