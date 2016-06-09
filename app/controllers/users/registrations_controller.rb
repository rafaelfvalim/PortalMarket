class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

# GET /resource/sign_up
  def new
    @user = User.new
    @user.build_member
    @user.build_address
    render layout: "empty"
  end

# POST /resource
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "#{t 'registration.successful', email: @user.email}"
        format.html { redirect_to '/users/sign_in' }
        format.json { render json: '/users/sign_in', status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

# GET /resource/edit
  def edit
    super
  end

# PUT /resource
  def update
    super
  end

# DELETE /resource
# def destroy
#   super
# end

# GET /resource/cancel
# Forces the session data which is usually expired after sign
# in to be expired now. This is useful if the user wants to
# cancel oauth signing in/up in the middle of the process,
# removing all OAuth session data.
# def cancel
#   super
# end

# protected

# If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:id,
               :name,
               :email,
               :password,
               :password_confirmation,
               member_attributes:
                   [:member_type_id,
                    :member_name,
                    :company_name,
                    :member_last_name,
                    :phone_number,
                    :cellphone_number,
                    :birthday,
                    :cpf,
                    :cnpj,
                    :bank_id,
                    :bank_ag,
                    :bank_cc,
                    :bank_cc_digit
                   ],
               address_attributes:
                   [:zip_code,
                    :patio_type,
                    :patio,
                    :number,
                    :neighborhood,
                    :city,
                    :state,
                    :complement])
    end
  end

# If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:id,
               :current_password,
               :name,
               :email,
               :password,
               :password_confirmation,
               :avatar,
               :avatar_cache,
               member_attributes:
                   [:id,
                    :member_type_id,
                    :member_name,
                    :company_name,
                    :member_last_name,
                    :phone_number,
                    :cellphone_number,
                    :birthday,
                    :cpf,
                    :cnpj,
                    :bank_id,
                    :bank_ag,
                    :bank_cc,
                    :bank_cc_digit
                   ],
               address_attributes:
                   [:id,
                    :zip_code,
                    :patio_type,
                    :patio,
                    :number,
                    :neighborhood,
                    :city,
                    :state,
                    :complement])
    end
  end

# The path used after sign up.
# def after_sign_up_path_for(resource)
#   super(resource)
# end

# The path used after sign up for inactive accounts.
# def after_inactive_sign_up_path_for(resource)
#   super(resource)
# end

  private
  def user_params
    params.require(:user).permit(:id,
                                 :name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :current_password,
                                 member_attributes:
                                     [:member_type_id,
                                      :member_name,
                                      :company_name,
                                      :member_last_name,
                                      :phone_number,
                                      :cellphone_number,
                                      :birthday,
                                      :cpf,
                                      :cnpj,
                                      :bank_id,
                                      :bank_ag,
                                      :bank_cc,
                                      :bank_cc_digit
                                     ],
                                 address_attributes:
                                     [:zip_code,
                                      :patio_type,
                                      :patio,
                                      :number,
                                      :neighborhood,
                                      :city,
                                      :state,
                                      :complement])
  end

end
