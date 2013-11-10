class MacAddressesController < ApplicationController
  before_action :set_mac_address, only: [:show, :edit, :update, :destroy]

  # GET /mac_addresses
  # GET /mac_addresses.json
  def index
    @mac_addresses = MacAddress.all
  end

  # GET /mac_addresses/1
  # GET /mac_addresses/1.json
  def show
  end

  # GET /mac_addresses/new
  def new
    @mac_address = MacAddress.new
  end

  # GET /mac_addresses/1/edit
  def edit
  end

  # POST /mac_addresses
  # POST /mac_addresses.json
  def create
    @mac_address = MacAddress.new(mac_address_params)

    respond_to do |format|
      if @mac_address.save
        format.html { redirect_to @mac_address, notice: 'Mac address was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mac_address }
      else
        format.html { render action: 'new' }
        format.json { render json: @mac_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mac_addresses/1
  # PATCH/PUT /mac_addresses/1.json
  def update
    respond_to do |format|
      if @mac_address.update(mac_address_params)
        format.html { redirect_to @mac_address, notice: 'Mac address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mac_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mac_addresses/1
  # DELETE /mac_addresses/1.json
  def destroy
    @mac_address.destroy
    respond_to do |format|
      format.html { redirect_to mac_addresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mac_address
      @mac_address = MacAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mac_address_params
      params.require(:mac_address).permit(:address, :mac_type)
    end
end
