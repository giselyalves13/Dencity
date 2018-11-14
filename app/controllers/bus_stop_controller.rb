class BusStopController < ApplicationController
  class << self
    include Resources::HttpClient
    include ::SPTrans::HttpClientConfiguration
    def search_for_lines
        params[rua]
        # params[px], params[py]
        # TODO: usar metodo PARADAS/BUSCAR na sptrans enviando lat e long ou nome e numero da rua
        # Retornar para view no mesmo controller
        # Quando usuário clicar na linha, dar um get na action do buses_controller
    end

    def sptrans_login
        #TODO: post/login/token
        token ="9cf92b800603de7a266f4400062d865a67ee64eeb4b968b01d608ffa7806b092"
        response = post("/Login/Autenticar?token=#{token}", payload: {}.to_json)
        puts response
    end
  end
end
