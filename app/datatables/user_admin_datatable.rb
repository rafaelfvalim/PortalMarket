class UserAdminDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_user_path
  def_delegator :@view, :user_path
  def_delegator :@view, :html_safe
  def_delegator :@view, :humanize
  def_delegator :@view, :simple_form_for

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= [
        'User.id',
        'User.name',
        'Member.cnpj',
        'Member.cpf',
        'Member.company_name',
        'User.email',
        'User.status',
        'User.confirmed_at'
    ]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= [
        'User.id',
        'User.name',
        'Member.cnpj',
        'Member.cpf',
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
          record.member.cnpj.present? ? record.member.cnpj : record.member.cpf,
          record.member.company_name,
          record.email,
          simple_form_for(record) do |u|
            u.input :status, as: :select, :collection => User.statuses.keys.to_a, label: false, include_blank: false, :input_html => {:onchange => "this.form.submit();"}
          end,
          if record.confirmed_at.present?
            '<i class="fa fa-check" style="color: green;"></i>'.html_safe
          else
            '<i class="fa fa-times" style="color: red;"></i>'.html_safe
          end,
          link_to("Show", user_path(record), :class => 'btn btn-info btn-xs'),
          link_to("Delete", user_path(record), :data => {:confirm => "Deseja excluir usuário?"}, :method => :delete, :class => 'btn btn-danger btn-xs', disabled: true)
      ]
    end
  end

  def get_raw_records

    if params[:status].present?
      User.joins(:member).where('status = ?', params[:status])
    elsif params[:unconfirmed] == 'true'
      User.joins(:member).where confirmed_at: nil
    else
      User.joins(:member).all
    end
  end

end
