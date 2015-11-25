class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_user, only: [:edit, :update, :show]

  def index
    if params[:search].present?
      @users = User.paginate(:page => params[:page], :per_page => 30).search(params[:search])
    else
      @users = User.all.paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
    end
  end

  def show
    unless current_user.admin? || current_user.is_god?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    if @user.update(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      Rails.logger.info(@user.errors.messages.inspect)
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

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:id, :role, :email, member_attributes: [:id, :member_type_id, :member_name, :company_name, :member_last_name, :birthday, :cpf, :cnpj, :bank_id, :bank_ag, :bank_cc, :bank_cc_digit, :created_at, :updated_at], member_type_attributes: [:id])
  end

end
