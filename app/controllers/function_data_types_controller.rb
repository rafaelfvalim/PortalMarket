class FunctionDataTypesController < ApplicationController
  before_action :set_function_data_type, only: [:show, :edit, :update, :destroy]

  # GET /function_data_types
  # GET /function_data_types.json
  def index
    @function_data_types = FunctionDataType.all
  end

  # GET /function_data_types/1
  # GET /function_data_types/1.json
  def show
  end

  # GET /function_data_types/new
  def new
    @function_data_type = FunctionDataType.new
  end

  # GET /function_data_types/1/edit
  def edit
  end

  # POST /function_data_types
  # POST /function_data_types.json
  def create
    @function_data_type = FunctionDataType.new(function_data_type_params)

    respond_to do |format|
      if @function_data_type.save
        format.html { redirect_to @function_data_type, notice: 'Function data type was successfully created.' }
        format.json { render :show, status: :created, location: @function_data_type }
      else
        format.html { render :new }
        format.json { render json: @function_data_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /function_data_types/1
  # PATCH/PUT /function_data_types/1.json
  def update
    respond_to do |format|
      if @function_data_type.update(function_data_type_params)
        format.html { redirect_to @function_data_type, notice: 'Function data type was successfully updated.' }
        format.json { render :show, status: :ok, location: @function_data_type }
      else
        format.html { render :edit }
        format.json { render json: @function_data_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /function_data_types/1
  # DELETE /function_data_types/1.json
  def destroy
    @function_data_type.destroy
    respond_to do |format|
      format.html { redirect_to function_data_types_url, notice: 'Function data type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function_data_type
      @function_data_type = FunctionDataType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_data_type_params
      params.require(:function_data_type).permit(:function_type, :user_id, :script_id, :description, :number_of_registers_types, :number_of_data_types, :complexity, :number_of_function_points)
    end
end
