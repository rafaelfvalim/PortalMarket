class FunctionTransactionTypesController < ApplicationController
  before_action :set_function_transaction_type, only: [:show, :edit, :update, :destroy]

  # GET /function_transaction_types
  # GET /function_transaction_types.json
  def index
    @function_transaction_types = FunctionTransactionType.all
  end

  # GET /function_transaction_types/1
  # GET /function_transaction_types/1.json
  def show
  end

  # GET /function_transaction_types/new
  def new
    @function_transaction_type = FunctionTransactionType.new
  end

  # GET /function_transaction_types/1/edit
  def edit
  end

  # POST /function_transaction_types
  # POST /function_transaction_types.json
  def create
    @function_transaction_type = FunctionTransactionType.new(function_transaction_type_params)

    respond_to do |format|
      if @function_transaction_type.save
        format.html { redirect_to @function_transaction_type, notice: 'Function transaction type was successfully created.' }
        format.json { render :show, status: :created, location: @function_transaction_type }
      else
        format.html { render :new }
        format.json { render json: @function_transaction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /function_transaction_types/1
  # PATCH/PUT /function_transaction_types/1.json
  def update
    respond_to do |format|
      if @function_transaction_type.update(function_transaction_type_params)
        format.html { redirect_to @function_transaction_type, notice: 'Function transaction type was successfully updated.' }
        format.json { render :show, status: :ok, location: @function_transaction_type }
      else
        format.html { render :edit }
        format.json { render json: @function_transaction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /function_transaction_types/1
  # DELETE /function_transaction_types/1.json
  def destroy
    @function_transaction_type.destroy
    respond_to do |format|
      format.html { redirect_to function_transaction_types_url, notice: 'Function transaction type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function_transaction_type
      @function_transaction_type = FunctionTransactionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_transaction_type_params
      params.require(:function_transaction_type).permit(:user_id, :script_id, :function_type, :description, :number_of_referenced_files, :number_of_data_types, :complexity, :number_of_function_points)
    end
end
