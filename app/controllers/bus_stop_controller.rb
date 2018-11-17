class BusStopController < ApplicationController
  class << self
    include Resources::HttpClient
    include ::Sptrans::HttpClientConfiguration
    #TODO: Criar rota para Resourses <ta dando erro não consegui resolver"
    def index
    end

    def search_for_bus_stop
      puts "METODO 1"
      if sptrans_login
        bus_stop_info_json = get("/Parada/Buscar?termosBusca=#{params[bus_stop_address]}")
        puts response
        @lines = search_for_lines(bus_stop_info_json[cp]) #cp = codigo da parada
        render bus_stop_search_for_bus_stop_path
      else puts "erro com login na sptrans"
      end
      # TODO: usar metodo PARADAS/BUSCAR na sptrans enviando lat e long ou nome e numero da rua
      # Retornar para view no mesmo controller
      # Quando usuário clicar na linha, dar um get na action do buses_controller
    end

    def search_for_lines(bus_stop_code)
      if sptrans_login
        lines_info_json = get("/Previsao/Parada?codigoParada=#{bus_stop_code}}")
        return lines_info_json[l] # l = atributo de linhas no json
      else puts "erro com login na sptrans"
      end
    end

    def sptrans_login
      #TODO: post/login/token
      puts "METODO 2"
      token ="9cf92b800603de7a266f4400062d865a67ee64eeb4b968b01d608ffa7806b092"
      response = post("/Login/Autenticar?token=#{token}", payload: {}.to_json)
      puts response
    end
  end
end
