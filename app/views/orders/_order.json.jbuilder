# frozen_string_literal: true

json.extract! order, :id, :restaurant_id, :product_id, :count, :status_id, :soft_delete, :created_at, :updated_at
json.url order_url(order, format: :json)
