class LandingPageContactMail < ApplicationMailer
  default from: "no-reply@klustterscript.com"
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  helper ApplicationHelper

  def landing_page_contact_mail(is_preview = false, landing_page_contact)
    @landing_page_contact = landing_page_contact
    mail(to: 'b2b@klustterscript.com', subject: 'KlustterScript cotanto sugestão')
  end
end
