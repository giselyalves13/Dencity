module Search
  include ::Resources::HttpClient
  include ::Sptrans::HttpClientConfiguration

  def search_for_line(line, prefix)
    termosBusca = line
    bus_info = get(url: "", params: { termosBusca: termosBusca, api: "LINHAS" })
    buses = JSON.parse bus_info.body
    buses['vs'].each do |bus|
      if bus['p'] == prefix
        return bus
      end
    end
  end
  return 404
end
