json.extract! estate, :id, :url, :name, :number, :email, :address, :latitude, :longitude, :size, :price, :created_at, :updated_at
json.url estate_url(estate, format: :json)