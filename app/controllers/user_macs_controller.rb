class UserMacsController < ApplicationController
  before_action :set_user_mac, only: [:show, :edit, :update, :destroy]

  # GET /user_macs
  # GET /user_macs.json
  def index
    @user_macs = UserMac.all
  end

  # GET /user_macs/1
  # GET /user_macs/1.json
  def show
  end

  # GET /user_macs/new
  def new
    @user_mac = UserMac.new
  end

  # GET /user_macs/1/edit
  def edit
  end

  # POST /user_macs
  # POST /user_macs.json
  def create
    @user_mac = UserMac.new(user_mac_params)

    respond_to do |format|
      if @user_mac.save
        format.html { redirect_to @user_mac, notice: 'User mac was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_mac }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_mac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_macs/1
  # PATCH/PUT /user_macs/1.json
  def update
    respond_to do |format|
      if @user_mac.update(user_mac_params)
        format.html { redirect_to @user_mac, notice: 'User mac was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_mac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_macs/1
  # DELETE /user_macs/1.json
  def destroy
    @user_mac.destroy
    respond_to do |format|
      format.html { redirect_to user_macs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_mac
      @user_mac = UserMac.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_mac_params
      params.require(:user_mac).permit(:user_id, :mac_address_id)
    end
end
