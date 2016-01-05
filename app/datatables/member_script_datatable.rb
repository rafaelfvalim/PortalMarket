class MemberScriptDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  #include AjaxDatatablesRails::Extensions::WillPaginate
  #include AjaxDatatablesRails::Extensions::SimplePaginator
  def_delegator :@view, :link_to
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :edit_script_path


  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Script.id', 'Script.name','Script.description','Script.platform', 'Script.industry','Script.complexity']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Script.id', 'Script.name', 'Script.description', 'Script.platform', 'Script.industry', 'Script.complexity']
  end

  private

  def data
    records.map do |record|
      [
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          record.id,
          record.name,
          record.description,
          record.platform,
          record.industry,
          record.complexity,
          link_to('Show', record, :class => 'btn btn-info btn-xs'),
          link_to('Edit', edit_script_path(record), :class => 'btn btn-primary btn-xs'),
      ]
    end
  end

  def get_raw_records
    Script.joins(:member_scripts).where(' member_scripts.member_id = ? AND member_scripts.partner = false', params[:member_id]).group('scripts.id')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
