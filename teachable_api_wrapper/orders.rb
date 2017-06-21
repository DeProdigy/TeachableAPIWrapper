require 'json'
require_relative 'fetcher'

module TeachableAPIWrapper
  class Orders
    def self.all(email, auth_token)
      auth_data = {
        user_email: email,
        user_token: auth_token,
      }

      response = TeachableAPIWrapper::Fetcher.get('/api/orders.json', auth_data)
      JSON.parse(response.body)
    end

    def self.create(email, total, total_quantity, special_instructions, auth_token)
      data = {
        order: {
          total: total,
          total_quantity: total_quantity,
          email: email,
          special_instructions: special_instructions,
        },
        user_email: email,
        user_token: auth_token,
      }

      response = TeachableAPIWrapper::Fetcher.post('/api/orders.json', data)
      JSON.parse(response.body)
    end

    def self.delete(id, email, auth_token)
      auth_data = {
        user_email: email,
        user_token: auth_token,
      }

      response = TeachableAPIWrapper::Fetcher.delete("/api/orders/#{id}.json", auth_data)
      JSON.parse(response.body)
    end
  end
end
