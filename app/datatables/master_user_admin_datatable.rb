class MasterUserAdminDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_user_path
  def_delegator :@view, :user_path
  def_delegator :@view, :html_safe
  def_delegator :@view, :humanize
  def_delegator :@view, :show_master_user_users_path
  def_delegator :@view, :destroy_master_user_users_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= [
        'User.id',
        'User.name',
        'Member.company_name',
        'User.email',
        'User.status',
        'User.confirmed_at..present?'
    ]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= [
        'User.id',
        'User.name',
        'Member.company_name',
        'User.email',
        'User.status'
    ]
  end

  private

  def data
    records.map do |record|
      [
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          record.id,
          record.full_name,
          record.member.company_name,
          record.email,
          "<b>#{record.status.humanize}</b>".html_safe,
          if record.confirmed_at.present?
            '<i class="fa fa-check" style="color: green;"></i>'.html_safe
          else
            '<i class="fa fa-times" style="color: red;"></i>'.html_safe
          end,
          unless record.id == options[:current_user].id
            link_to("Show", show_master_user_users_path(id: record.id), :class => 'btn btn-info btn-xs')
          end,
          unless record.id == options[:current_user].id
            link_to("Delete", destroy_master_user_users_path(id: record.id), :data => {:confirm => "Deseja excluir usuário?"}, :method => :get, :class => 'btn btn-danger btn-xs')
          end
      ]
    end
  end

  def get_raw_records
    User.joins(:member).where("members.master_user_id = ?", options[:current_user].id)
  end

end
