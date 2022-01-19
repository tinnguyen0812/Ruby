json.extract! sp_cart, :id, :id_product, :quantity, :created_at, :updated_at
json.url sp_cart_url(sp_cart, format: :json)
