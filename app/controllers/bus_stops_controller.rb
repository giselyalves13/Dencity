require 'net/http'
require 'cgi'

class BusStopsController < ApplicationController
  include Resources::HttpClient
  include ::Sptrans::HttpClientConfiguration

  def index
  end

  def search_for_bus_stop
    termosBusca = params[:bus_stop_address]
    bus_stop_info_json = get(url: "", params: { termosBusca: termosBusca, api: "PARADAS" })
    @lines = JSON.parse bus_stop_info_json.body
    render bus_stops_search_for_bus_stop_path
  end

  class << self
    include Resources::HttpClient
    include ::Sptrans::HttpClientConfiguration
    def search_for_line(line, prefix)
      termosBusca = line
      bus_info = get(url: "", params: { termosBusca: termosBusca, api: "LINHAS" })
      buses = JSON.parse bus_info.body
      # buses['vs'].each do |bus|
        # if bus['p'] == prefix
          # return bus
      # end
    # end
    return buses
    end
  end
end
