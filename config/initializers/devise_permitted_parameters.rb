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
      u.permit(:name, :email, :password, :password_confirmation, member_attributes: [:member_name, :member_last_name, :birthday, :bank, :bank_ag, :bank_cc, :customer, :contributor, :cpf, :cpj])
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, member_attributes: [:member_name, :member_last_name, :birthday, :bank, :bank_ag, :bank_cc, :customer, :contributor, :cpf, :cpj])
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
