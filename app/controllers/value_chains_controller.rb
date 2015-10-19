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

  def build
    @action = 'create'
    @script = Script.find_by id: params[:id]
    @value_chain = ValueChain.new
    @create_script_tracker = 'complete'
    @additional_information = 'complete'
    @value_chain_tracker = 'active'
    @process_modules = ProcessModule.where('referrer_process_module_id is null')
  end

  def edit_build
    @action = 'edit'
    @script = Script.find_by id: params[:id]
    @value_chain = ValueChain.new
    @create_script_tracker = 'complete'
    @additional_information = 'complete'
    @value_chain_tracker = 'active'
    @process_modules = ProcessModule.where('referrer_process_module_id is null')
  end

  def classification
    @process_module = ProcessModule.find(params[:id])
    @script_id = params[:script_id]
    if request.referrer.include?('/edit_build')
      @sub_action = 'edit'
    else
      @sub_action = 'create'
    end
  end

  def create_ajax
    @value_chains ||= []
    @errors_list ||= []
    params[:process].each do |process|
      if process.present?
        @value_chain = ValueChain.new(process_module_id: process[:id], script_id: params[:script_id])
        if !@value_chain.save
          @errors_list.push(@value_chain.errors.full_messages)
        end
      end
    end
    @value_chains.sort_by &:process_module_id
    sub_action = params[:sub_action]
    respond_to do |format|

      if @errors_list.size == 0
        if sub_action == 'edit'
          format.html { redirect_to edit_build_value_chains_path(:id => params[:script_id]) }
        else
          format.html { redirect_to build_value_chain_path(:id => params[:script_id]) }
        end
      end
    end
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
    process = app_get_breadcrumb_value_chain(@value_chain.process_module_id)
    if process.size > 0
      process.each do |process|
        value_chain =ValueChain.find_by process_module_id: process.id, script_id: @value_chain.script_id
        value_chain.destroy
      end
    else
      process.destroy
    end
    @referer = URI(request.referer).path
    respond_to do |format|
      if @referer.include?('/value_chains/build/')
        format.json { head :no_content }
        format.html { redirect_to value_chains_url, notice: 'Value chain was successfully destroyed.' }
      else
        format.html { redirect_to edit_build_value_chains_path(id: @value_chain.script_id), notice: 'Value chain was successfully destroyed.' }
        format.json { head :no_content }
      end
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
