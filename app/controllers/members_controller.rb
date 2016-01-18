class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_active

  # GET /members
  # GET /members.json
  def index
    if current_user.is_god?
      respond_to do |format|
        format.html { redirect_to admin_members_path }
      end
    end
    if current_user.is_customer?
      respond_to do |format|
        format.html { redirect_to customer_members_path }
      end
    end
    if current_user.is_contributor?
      respond_to do |format|
        format.html { redirect_to contributor_members_path }
      end
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  def lounge
    unless current_user.inativo?
      respond_to do |format|
        case
          when current_user.is_god? then
            format.html { redirect_to admin_members_path }
          when current_user.is_customer? then
            format.html { redirect_to members_path }
          when current_user.is_contributor? then
            format.html { redirect_to members_path }
        end
      end
    end
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  def admin
    unless current_user.is_god?
      respond_to do |format|
        format.html { redirect_to members_path }
      end
    end
  end

  def contributor_incomplete_actions
    @scripts_incomplete = Script.joins(:member_scripts).where(status_id: Status::INICIAL, member_scripts: {:member_id => current_user.member.id})
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def customer
    unless current_user.is_customer?
      respond_to do |format|
        format.html { redirect_to members_path }
      end
    end
  end

  def contributor
    unless current_user.is_contributor?
      respond_to do |format|
        format.html { redirect_to members_path }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params[:member]
  end


end
