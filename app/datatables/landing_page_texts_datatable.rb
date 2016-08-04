class LandingPageTextsDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user
  def_delegator :@view, :simple_form_for
  def_delegator :@view, :edit_landing_text_path
  def_delegator :@view, :landing_text_path

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['LandingText.location_name']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['LandingText.location_name']
  end

  private
  def data
    records.map do |record|
      [
          record.location_name,
          link_to("Edit", edit_landing_text_path(record), class: 'btn btn-primary btn-xs'),
          link_to("Delete", landing_text_path(record), :data => {:confirm => "Deseja apagar?"}, :method => :delete, :class => 'btn btn-danger btn-xs ')
      ]
    end
  end

  def get_raw_records
    LandingText.all
  end
end
