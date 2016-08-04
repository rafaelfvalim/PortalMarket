class LandingPageImagesDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user
  def_delegator :@view, :simple_form_for
  def_delegator :@view, :edit_landing_page_image_path
  def_delegator :@view, :landing_page_image_path

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['LandingPageImage.name']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['LandingPageImage.name']
  end

  private
  def data
    records.map do |record|
      [
          record.name,
          link_to("Edit", edit_landing_page_image_path(record), class: 'btn btn-primary btn-xs'),
          link_to("Delete", landing_page_image_path(record), :data => {:confirm => "Deseja apagar?"}, :method => :delete, :class => 'btn btn-danger btn-xs')
      ]
    end
  end

  def get_raw_records
    LandingPageImage.all
  end
end
