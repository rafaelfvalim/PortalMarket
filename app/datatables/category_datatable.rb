class CategoryDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_category_path
  def_delegator :@view, :category_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Category.id', 'Category.description', 'Category.search_param', 'Category.image_dummy']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Category.id', 'Category.description', 'Category.search_param', 'Category.image_dummy']
  end

  private

  def data
    records.map do |record|
      [
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          record.id,
          record.description,
          record.search_param,
          record.image_dummy_url,
          link_to("Edit", edit_category_path(record), :class => 'btn btn-primary btn-xs'),
          link_to("Delete", category_path(record), :data => {:confirm => "Deseja excluir usuário?"}, :method => :delete, :class => 'btn btn-danger btn-xs')
      ]
    end
  end

  def get_raw_records
    Category.all
  end

end
