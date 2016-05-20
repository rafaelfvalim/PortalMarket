class LicenseDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user
  def_delegator :@view, :simple_form_for
  def_delegator :@view, :button_tag
  def_delegator :@view, :cancel_license_licenses_path
  def_delegator :@view, :generate_key_licenses_path
  def_delegator :@view, :enableGenerateLicense

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['licenses.id', 'licenses.invoice_id', 'invoices.script_id', 'licenses.description', 'invoices.script_file', 'licenses.license_key', 'licenses.expiration_date']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['licenses.id', 'licenses.invoice_id', 'invoices.script_id', 'licenses.description', 'invoices.script_file', 'licenses.license_key', 'licenses.expiration_date']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          record.invoice_id,
          record.invoice.script_id,
          "<small>#{record.description}</small>",
          "<small>#{record.invoice.script_file}</small>",
          "<small>#{record.license_key}</small>",
          record.expiration_date.nil? ? '' : record.expiration_date.strftime("%d/%m/%Y"),
          link_to('Gerar licença', generate_key_licenses_path(id: record.id, invoice_id: record.invoice_id), :class => 'btn btn-info btn-xs', disabled: record.license_key.present? || record.invoice.invoice_status_id == 5, remote: true),
          link_to('Desisitir', cancel_license_licenses_path(invoice_id: record.invoice_id), class: 'btn btn-warning btn-xs ', disabled: enableGenerateLicense(record), remote: true),
      ]
    end
  end

  def get_raw_records
    License.joins(:invoice).where('invoices.user_id = ?', current_user.id)
  end

end
