class MemberScriptDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  #include AjaxDatatablesRails::Extensions::SimplePaginator
  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :edit_script_path


  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Script.id', 'Script.platform', 'Script.industry']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Script.id', 'Script.description', 'Script.platform', 'Script.industry', 'Script.complexity']
  end

  private

  def data
    records.map do |record|
      [
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          record.id,
          record.description,
          record.definition,
          record.platform,
          record.industry,
          record.complexity,
          link_to('Show', record, :class => 'btn btn-primary'),
          link_to('Edit', edit_script_path(record), :class => 'btn btn-primary'),
          link_to('Delete', record, method: :delete, data: {confirm: 'Are you sure?'}, :class => 'btn btn-primary'),
      ]
    end
  end

  def get_raw_records
    Script.select('*').joins(:member_scripts).where('scripts.id = member_scripts.script_id and member_scripts.member_id = ?', params[:member_id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
