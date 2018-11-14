json.extract! bus, :id, :prefix, :line, :load, :arrival_time, :py, :px, :created_at, :updated_at
json.url bus_url(bus, format: :json)
