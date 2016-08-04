class ScriptCategoryDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_script_category_path
  def_delegator :@view, :script_category_path
  def_delegator :@view, :simple_form_for
  def_delegator :@view, :simple_fields_for
  def_delegator :@view, :simple_fields_for
  def_delegator :@view, :hidden_field_tag

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Script.id', 'Script.name', 'Script.description']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Script.id', 'Script.name', 'Script.description']
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
          simple_form_for(record) do |s|
            s.simple_fields_for :script_category do |sc|
              sc.input :category_id, collection: Category.all, label_method: :description, label: false, include_blank: 'Selecione ...', :input_html => {:onchange => "this.form.submit();"}
            end
          end,
          link_to("Delete", script_category_path(record), :data => {:confirm => "Deseja excluir usuário?"}, :method => :delete, :class => 'btn btn-danger btn-xs')
      ]
    end
  end

  def get_raw_records
    Script.includes(:script_category).all
  end


end
