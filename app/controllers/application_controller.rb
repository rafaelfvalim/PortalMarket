class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method :app_custom_routes
  # helper_method :app_custom_routes_errors
  helper_method :app_get_breadcrumb_value_chain
  helper_method :app_get_system_id_by_name
  # def app_custom_routes(format, referrer, model)
  #   if referrer.include?('additional_information')
  #     format.json { render json: model, notice: 'Process module was successfully created.' }
  #   else
  #     format.html { redirect_to model, notice: 'Process module was successfully created.' }
  #     format.json { render :show, status: :created, location: model }
  #   end
  # end
  #
  # def app_custom_routes_errors(format, referrer, model)
  #   if referrer.include?('additional_information')
  #     format.json { render json: model.errors, status: :unprocessable_entity }
  #   else
  #     format.html { render :new }
  #     format.json { render json: model.errors, status: :unprocessable_entity }
  #   end
  # end

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
end
