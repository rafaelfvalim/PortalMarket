class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :app_custom_routes
  helper_method :app_custom_routes_errors

  def app_custom_routes(format, referrer, model)
    if referrer.include?('additional_information')
      format.json { render json: model, notice: 'Process module was successfully created.' }
    else
      format.html { redirect_to model, notice: 'Process module was successfully created.' }
      format.json { render :show, status: :created, location: model }
    end
  end

  def app_custom_routes_errors(format, referrer, model)
    if referrer.include?('additional_information')
      format.json { render json: model.errors, status: :unprocessable_entity }
    else
      format.html { render :new }
      format.json { render json: model.errors, status: :unprocessable_entity }
    end
  end

end
