json.extract! product, :id, :title, :description, :brand, :price, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
