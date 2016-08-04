class LandingPageBannersDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate
  def_delegator :@view, :link_to
  def_delegator :@view, :current_user
  def_delegator :@view, :edit_landing_page_banner_path
  def_delegator :@view, :landing_page_banner_path
  def_delegator :@view, :simple_form_for

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['LandingPageBanner.name']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @searchable_columns ||= ['LandingPageBanner.name']
  end

  private
  def data
    records.map do |record|
      [
          record.name,
          record.position,
          link_to("Edit", edit_landing_page_banner_path(record), class: 'btn btn-primary btn-xs'),
          link_to("Delete", landing_page_banner_path(record), :data => {:confirm => "Deseja apagar?"}, :method => :delete, :class => 'btn btn-danger btn-xs')
      ]
    end
  end

  def get_raw_records
    LandingPageBanner.all
  end
end
