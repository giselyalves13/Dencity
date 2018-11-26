module Sptrans
  module HttpClientConfiguration
    private

    def base_url
      Sptrans.configuration.base_url
    end

    def auth_header
      { 'access-token' => Sptrans.configuration.token }
      # { 'set-cookie' => ''}
    end

    def basic_headers
      { 'User-Agent' => 'dencity',
        'Content-Type' => 'application/json',
        'Accept' => 'application/json' }.merge(auth_header)
    end
  end
end
