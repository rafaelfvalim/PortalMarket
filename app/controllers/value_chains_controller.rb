class ValueChainsController < ApplicationController
  before_action :set_value_chain, only: [:show, :edit, :update, :destroy]

  # GET /value_chains
  # GET /value_chains.json
  def index
    @value_chains = ValueChain.all
  end

  # GET /value_chains/1
  # GET /value_chains/1.json
  def show
  end

  # GET /value_chains/new
  def new
    @value_chain = ValueChain.new
  end

  # GET /value_chains/1/edit
  def edit
  end

  # POST /value_chains
  # POST /value_chains.json
  def create
    @value_chain = ValueChain.new(value_chain_params)

    respond_to do |format|
      if @value_chain.save
        format.html { redirect_to @value_chain, notice: 'Value chain was successfully created.' }
        format.json { render :show, status: :created, location: @value_chain }
      else
        format.html { render :new }
        format.json { render json: @value_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_chains/1
  # PATCH/PUT /value_chains/1.json
  def update
    respond_to do |format|
      if @value_chain.update(value_chain_params)
        format.html { redirect_to @value_chain, notice: 'Value chain was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_chain }
      else
        format.html { render :edit }
        format.json { render json: @value_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_chains/1
  # DELETE /value_chains/1.json
  def destroy
    @value_chain.destroy
    respond_to do |format|
      format.html { redirect_to value_chains_url, notice: 'Value chain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_chain
      @value_chain = ValueChain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_chain_params
      params.require(:value_chain).permit(:process_module_id, :script_id)
    end
end
