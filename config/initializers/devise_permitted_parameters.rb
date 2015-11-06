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
      u.permit(:name, :email, :password, :password_confirmation, member_attributes: [:member_type_id, :cnpj, :bank_id, :bank_cc_digit, :member_name, :birthday, :member_last_name, :birthday, :bank, :bank_ag, :bank_cc, :company_name, :customer, :contributor, :cpf])
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, member_attributes: [:member_type_id, :cnpj, :bank_id, :bank_cc_digit, :member_name, :birthday, :member_last_name, :birthday, :bank, :bank_ag, :bank_cc, :company_name, :customer, :contributor, :cpf])
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
