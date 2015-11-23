class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_user, only: [:edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin? || current_user.is_god?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def edit
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin? || current_user.is_god?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role, members_attributes: [:id, :user_id, :member_type_id, :birthday, :member_name, :member_last_name, :bank_id, :bank_ag, :bank_cc, :bank_cc_digit, :cpf, :cnpj, :company_name])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end
