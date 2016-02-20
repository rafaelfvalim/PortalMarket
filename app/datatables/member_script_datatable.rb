class MemberScriptDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  #include AjaxDatatablesRails::Extensions::WillPaginate
  #include AjaxDatatablesRails::Extensions::SimplePaginator
  def_delegator :@view, :link_to
  def_delegator :@view, :link_to_if
  def_delegator :@view, :h
  def_delegator :@view, :mail_to
  def_delegator :@view, :edit_script_path
  def_delegator :@view, :roll_back_script_scripts_path
  def_delegator :@view, :disabled


  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['Script.id',
                           'Script.name',
                           'Script.description',
                           'Script.platform',
                           'Status.description',
                           'Script.has_price'
    ]
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['Script.id',
                             'Script.name',
                             'Script.description',
                             'Script.platform',
                             'Script.industry',
                             'Script.complexity',
                             'Status.description']
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
          record.status.description,
          if record.has_price.present?
            '<i class="fa fa-check" style="color: green;"></i>'.html_safe
          else
            '<i class="fa fa-times" style="color: red;"></i>'.html_safe
          end,
          link_to('Show', record, :class => 'btn btn-info btn-xs'),

          if record.status_id == Status::INICIAL && !record.has_price || record.status_id == Status::GRAVADO && !record.has_price
            link_to('Edit', edit_script_path(record), :class => 'btn btn-primary btn-xs')
          end,

          if record.status_id == Status::INICIAL && !record.has_price || record.status_id == Status::GRAVADO && !record.has_price
            link_to('Delete', roll_back_script_scripts_path(id: record.id), data: {confirm: 'Are you sure?'}, :class => 'btn btn-primary btn-xs')
          end
      ]
    end
  end

  def get_raw_records
    Script.joins(:member_scripts, :members, :status).where(' member_scripts.member_id = ? ', params[:member_id]).group('scripts.id')
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
