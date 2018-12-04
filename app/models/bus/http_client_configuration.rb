module Bus
  module HttpClientConfiguration
    private

    def base_url
      Bus.configuration.base_url
    end

    def auth_header
      {}
    end

    def basic_headers
      { 'User-Agent' => 'dencity',
        'Content-Type' => 'application/json',
        'Accept' => 'application/json' }.merge(auth_header)
    end
  end
end
