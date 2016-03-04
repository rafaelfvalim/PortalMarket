class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :user_active, if: :signed_in?
  before_action :set_timezone, if: :current_user
  layout :layout_by_resource

  helper_method :app_get_breadcrumb_value_chain
  helper_method :app_get_system_id_by_name

  def user_active

    unless current_user.ativo?
      if controller_name != "sessions" && action_name != "destroy"
        respond_to do |format|
          format.html { render 'members/lounge' }
        end
      end
    end
  end

  def after_sign_up_path_for(resource)
    'visitors/lounge_sing_up'
  end

  def app_get_breadcrumb_value_chain(id)
    breadcrumb ||= Array.new
    ProcessModule.where(id: id).each do |pp1|
      next_id = pp1.referrer_process_module_id
      breadcrumb.push(pp1)
      loop do
        break if next_id.nil? || next_id == ''
        ProcessModule.where(id: next_id).each do |pp2|
          breadcrumb.push(pp2)
          next_id = pp2.referrer_process_module_id
        end
      end
    end
    return breadcrumb.reverse
  end

  def set_tracker_step(action)
    case action
      when :create then
        @step1 = 'active'
      when :edit then
        @step1 = 'active'
      when :additional_data then
        @step1 = 'complete'
        @step2 = 'active'
      when :value_chain then
        @step1 = 'complete'
        @step2 = 'complete'
        @step3 = 'active'
      when :final then
        @step1 = 'complete'
        @step2 = 'complete'
        @step3 = 'complete'
        @final = 'active'
    end
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :status => :not_found }
    end
  end

  def acess_control
    unless current_user.is_god?
      redirect_to members_path, :alert => "Restricted access! "
    end
  end

  private
  def layout_by_resource

    if controller_name == 'registrations'
      #algumas paginas do devise devem aparecer dentro do site
      case action_name
        when 'edit' then
          return 'application'
        when 'update' then
          return 'application'
        else
          return 'empty'
      end
    end
    if controller_name == 'passwords'
      return 'empty'
    end
    if controller_name == 'sessions'
      return 'empty'
    end

    if controller_name == 'confirmations'
      return 'empty'
    end

    if controller_name == 'emails'
      return 'empty'
    end

    if controller_name == 'errors'
      return 'empty'
    end
  end

  def set_timezone
    tz = current_user ? current_user.timezone : nil
    Time.zone = tz || ActiveSupport::TimeZone["Brasilia"]
  end

  def admin_only
    unless current_user.admin? || current_user.is_god?
      redirect_to :back, :alert => "Access denied."
    end
  end

end
