class ScriptPriceDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user
  def_delegator :@view, :collection_select
  def_delegator :@view, :simple_form_for
  def_delegator :@view, :new_price_path

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Script.id', 'Script.name', 'Script.description', 'Status.description', 'Script.complexity']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Script.id', 'Script.name', 'Script.description', 'Status.description', 'Script.complexity']
  end

  private

  def data

    records.map do |record|
      [
          record.id,
          link_to(record.description, record),
          record.status.description,
          record.complexity,
          (Date.today - record.updated_at.to_date).to_i,
          link_to('Adicionar Preço', new_price_path(script_id: record.id), :class => 'btn btn-info btn-xs')
      ]
    end
  end

  def get_raw_records
    Script.joins(:status).where('has_price is null or has_price = 0 ')
  end
end
