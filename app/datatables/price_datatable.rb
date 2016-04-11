class PriceDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user
  def_delegator :@view, :collection_select
  def_delegator :@view, :simple_form_for
  def_delegator :@view, :new_price_path
  def_delegator :@view, :edit_price_path
  def_delegator :@view, :number_to_currency

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Price.id', 'Script.description', 'Status.description', 'Price.value', 'Currency.description','Price.currency_data']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Price.id', 'Script.description', 'Status.description', 'Price.value', 'Currency.description','Price.currency_data']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          record.script.description,
          record.script.status.description,
          number_to_currency(record.value),
          record.currency.description,
          record.currency_data,
          link_to("Editar", edit_price_path(record), class: 'btn btn-primary')
      ]
    end
  end

  def get_raw_records
    Price.joins(:script, :currency, :status).all
  end
end
