class ScriptDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  #include AjaxDatatablesRails::Extensions::Kaminari
  include AjaxDatatablesRails::Extensions::WillPaginate
  #include AjaxDatatablesRails::Extensions::SimplePaginator

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Script.id', 'Script.name', 'Script.description', 'Script.platform', 'Script.industry', 'Script.complexity']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Script.description', 'Script.platform', 'Script.industry', 'Script.complexity']
  end

  private

  def data
    records.map do |record|
      [
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          record.id,
          record.description,
          record.platform,
          record.industry,
          record.solution_type_id,
          record.script_file,
          record.pdf_file,
          record.complexity
      ]
    end
  end

  def get_raw_records
    # insert query here
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
