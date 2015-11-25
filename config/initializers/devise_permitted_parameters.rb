module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :name
    #devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, member_attributes: [:member_type_id, :member_name, :company_name, :member_last_name, :birthday, :cpf, :cnpj, :bank_id, :bank_ag, :bank_cc, :bank_cc_digit], address_attributes: [:zip_code, :patio_type, :patio, :number, :neighborhood, :city, :state, :complement])
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, member_attributes: [:member_type_id, :member_name, :company_name, :member_last_name, :birthday, :cpf, :cnpj, :bank_id, :bank_ag, :bank_cc, :bank_cc_digit], address_attributes: [:zip_code, :patio_type, :patio, :number, :neighborhood, :city, :state, :complement])
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
