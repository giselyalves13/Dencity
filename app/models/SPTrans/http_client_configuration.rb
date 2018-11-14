module SPTrans
  module HttpClientConfiguration
    private

    def base_url
      # TODO
      "http://api.olhovivo.sptrans.com.br/v2.1/"
    end

    def auth_header
      { 'access-token' => #TOKEN }
    end

    def basic_headers
      { 'User-Agent' => 'dencity',
        'Content-Type' => 'application/json',
        'Accept' => 'application/json' }.merge(auth_header)
    end
  end
end
