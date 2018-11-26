require 'net/http'
require 'cgi'

class BusStopsController < ApplicationController
    include Resources::HttpClient
    include ::Sptrans::HttpClientConfiguration
    #TODO: Criar rota para Resourses <ta dando erro não consegui resolver"
    def index
      @teste = "oi"
    end

    def search_for_bus_stop
      puts "METODO 1"
      termosBusca = params[:bus_stop_address]
      puts termosBusca
      # cookie = sptrans_login
      # if !cookie.nil?
        # bus_stop_info_json = get(url: "v2.1/Parada/Buscar", params: {token: token})
        bus_stop_info_json = get(url: "", params: { termosBusca: termosBusca, api: "PARADAS" })
        puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&7'
        puts bus_stop_info_json
        puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&7'
        @lines = JSON.parse bus_stop_info_json.body
        # @lines = @lines.to_s[8..-2].split("]").map { |ch| ch+"]"}
        # @lines = search_for_lines(bus_stop_info_json[cp]) #cp = codigo da parada
        render bus_stops_search_for_bus_stop_path
      # else @lines[0] = "erro com login na sptrans"
      # end
      # TODO: usar metodo PARADAS/BUSCAR na sptrans enviando lat e long ou nome e numero da rua
      # Retornar para view no mesmo controller
      # Quando usuário clicar na linha, dar um get na action do buses_controller
    end

    def search_for_lines(bus_stop_code)
      if sptrans_login
        lines_info_json = get(url: "v2.1/Previsao/Parada?codigoParada=#{bus_stop_code}}")
        return lines_info_json[l] # l = atributo de linhas no json
      else puts "erro com login na sptrans"
      end
    end

    # def sptrans_login
    #   #TODO: post/login/token
    #   puts "METODO 2"
    #   token ="9cf92b800603de7a266f4400062d865a67ee64eeb4b968b01d608ffa7806b092"

    #   payload = {}.to_json
    #   puts '----------------------------------------------------------------------------------'
    #   # response = post(url: "v2.1/Login/Autenticar?token={#{token}}")
    #   response = post(url: "v0/Login/Autenticar", params: {token: token})
    #   puts '********************************************'
    #   puts JSON.parse response.body
    #   puts response.headers.to_json
    #   puts response.status.to_s
    #   puts '********************************************'
    #   JSON.parse response.headers.to_json
    # end

    # helper_method :search_for_bus_stop
end
