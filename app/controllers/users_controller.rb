class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_user, only: [:edit, :update, :show, :remove_avatar, :upload_avatar, :resend_confirmation_email]

  def self.default_timezone
    :utc
  end


  def index
    if params[:search].present?
      @users = User.paginate(:page => params[:page], :per_page => 30).search(params[:search])
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
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    else
      if current_user.id != @user.member.master_user_id
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    if @user.update(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def master_user
    if params[:search_members].present?
      @users = User.paginate(:page => params[:page], :per_page => 30).search_members(params[:search_members], params[:search_by], current_user)
    else
      @users = User.joins(:member).where("members.master_user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
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
    user.destroy
    redirect_to users_path, :notice => "User deleted."
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
    @user.update(secure_params)
    redirect_to :back
  end

  private

  def admin_only
    unless current_user.admin? || current_user.is_god?
      redirect_to :back, :alert => "Access denied."
    end
  end

# Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :avatar,
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
                                     [:id],
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
