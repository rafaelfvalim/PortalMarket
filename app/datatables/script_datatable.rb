class ScriptDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Script.id', 'Script.name', 'Script.description', 'Script.platform', 'Script.complexity', 'Script.pdf_file', 'Script.script_file']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Script.id', 'Script.name','Script.description', 'Script.platform', 'Script.complexity', 'Script.pdf_file', 'Script.script_file']
  end

  private

  def data
    records.map do |record|
      [
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          record.id,
          record.status.id,
          record.name,
          record.platform,
          record.complexity,
          File.basename(record.pdf_file_url),
          File.basename(record.script_file_url),
          link_to('Detalhes', record, :class => 'btn btn-info btn-xs'),
      ]
    end
  end

  def get_raw_records
    Script.joins(:member_scripts, :status).where('member_scripts.member_id = ? and status_id = ?', current_user.member.id, params[:status_id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
