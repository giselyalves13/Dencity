class BusStopController < ApplicationController
    def search_for_lines
        params[px], params[py]
        # usar metodo PARADAS/BUSCAR na sptrans enviando lat e long ou nome e numero da rua
    end
   
    def sptrans_login
        post/login/token
    end

   
end
