require 'net/http'
require 'cgi'

class BusesController < ApplicationController
  include Resources::HttpClient
  include ::Bus::HttpClientConfiguration

  # GET /buses
  # GET /buses.json
  def index
    # @buses = Bus.all
  end

  # GET /buses/1
  # GET /buses/1.json
  def show
    id = params[:id]
    cl = params[:cl] # código identificador único da linha
    @name = params[:name]
    # get info from endpoint
    @bus_info = get(url: "buses", params: { id: id })
    @bus_info = JSON.parse @bus_info.body
    @bus_info = @bus_info

    #get info from sptrans
    @bus_sptrans = BusStopsController.search_for_line(cl, id)
    # TODO
    # plotar localização do bus no ônibus
    # exibir lotação
    @bus = nil
  end

  # GET /buses/new
  def new
    @bus = Bus.new
  end

  # GET /buses/1/edit
  def edit
  end

  # POST /buses
  # POST /buses.json
  def create
    @bus = Bus.new(bus_params)

    respond_to do |format|
      if @bus.save
        format.html { redirect_to @bus, notice: 'Bus was successfully created.' }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buses/1
  # PATCH/PUT /buses/1.json
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to @bus, notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_load
    bus_load = Bus.find_by(id:@bus)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_params
      params.require(:bus).permit(:prefix, :line, :load, :arrival_time, :py, :px)
    end
end
