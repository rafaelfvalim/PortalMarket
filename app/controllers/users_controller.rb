class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: [:index]
  before_action :set_user, only: [:edit, :update, :show, :show_master_user, :edit_master_user, :update_master_user, :remove_avatar, :upload_avatar, :resend_confirmation_email]
  before_action :user_active, if: :signed_in?

  def self.default_timezone
    :utc
  end

  def index
    if params[:search].present?
      @users = User.paginate(:page => params[:page], :per_page => 30).search(params[:search], params[:attribute])
    else
      @users = User.all.paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
    end

  end

  def resend_confirmation_email
    @user.send_confirmation_instructions
    redirect_to :back, :notice => "Sent to " + @user.email
  end

  def show
    unless current_user.admin? || current_user.is_god?
      if @user.member.master_user_id != current_user.id
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def show_master_user

  end

  def edit_master_user
  end

  def authenticator
    user_service = UserService.new
    if NetService.new.up?(Rails.configuration.webservice_user_token)
      @token = user_service.generateToken(current_user.member.cpf)
      respond_to do |format|
        format.js { render "users/token" }
        format.html {}
      end
    end

  end

  def update_master_user
    if @user.update(secure_params)
      redirect_to master_user_users_path, :notice => t('labels.user_messages.update')
    else
      redirect_to master_user_users_path, :alert => t('labels.user_messages.update_error')
    end
  end

  def update
    if @user.update(secure_params)
      @user.avatar.recreate_versions!
      if params[:user][:avatar].present?
        render :crop ## Render the view for cropping
      else
        redirect_to users_path, :notice => t('labels.user_messages.update')
      end
    else
      redirect_to users_path, :alert => t('labels.user_messages.update_error')
    end
  end

  def master_user
    if params[:search_members].present?
      @users = User.paginate(:page => params[:page], :per_page => 30).search_members(params[:search_members], params[:search_by], current_user)
    else
      @users = User.joins(:member).where("members.master_user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
    end
  end

  def master_user_ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: MasterUserAdminDatatable.new(view_context, {current_user: current_user}) }
    end
  end

  def admin_user_ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: UserAdminDatatable.new(view_context) }
    end
  end

  def master_registration
    @user = User.new
    @user.build_member
    @user.build_address
  end

  def edit

  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_path, :notice => t('labels.user_messages.delete')
    else
      redirect_to users_path, :notice => t('labels.user_messages.delete_error')
    end

  end

  def destroy_master_user
    user = User.find(params[:id])
    if user.destroy
      redirect_to master_user_users_path, :notice => t('labels.user_messages.delete')
    else
      redirect_to master_user_users_path, :notice => t('labels.user_messages.delete_error')
    end

  end

  def create_sub_user
    @user = User.new(secure_params)
    @user.member.member_type_id = current_user.member_type.id
    @user.member.master_user_id = current_user.id
    @user.member.company_name = current_user.member.company_name
    respond_to do |format|
      if @user.save
        @user.ativo!
        format.html { redirect_to master_user_users_path, notice: 'Welcome! Your account has been created successfully. A confirmation link has been sent to your email address.' }
        format.json { render json: master_user_users_path, status: :created, location: @user }
      else
        format.html { render action: "master_registration" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def remove_avatar
    @user.remove_avatar!
    if @user.save
      redirect_to :back
    end
  end

  def upload_avatar
    if @user.update(secure_params)
      @user.avatar.cache_stored_file!
      @user.avatar.recreate_versions!(:thumb, :circle_avatar)
      redirect_to edit_user_registration_path
    else
      redirect_to edit_user_registration_path, :alert => "Error :: Verifique o formato eo tamanho do arquivo"
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:id,
                                 :name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :avatar,
                                 :status,
                                 :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h,
                                 member_attributes:
                                     [:id,
                                      :member_type_id,
                                      :master_user_id,
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
                                      :bank_cc_digit,
                                      :created_at,
                                      :updated_at
                                     ],
                                 member_type_attributes:
                                     [:id,
                                      :description],
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
