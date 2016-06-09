class ServiceMonitorsController < ApplicationController
  before_action :set_service_monitor, only: [:show, :edit, :update, :destroy]
  before_action :admin_only
  # GET /service_monitors
  # GET /service_monitors.json
  def index
  end

  # GET /service_monitors/1
  # GET /service_monitors/1.json
  def show
  end

  # GET /service_monitors/new
  def new
  end

  # GET /service_monitors/1/edit
  def edit
  end



end
