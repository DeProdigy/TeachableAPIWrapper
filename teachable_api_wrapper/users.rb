require 'json'
require_relative 'fetcher'

module TeachableAPIWrapper
  class Users
    def self.register(email, password, password_confirmation)
      data = {
        user: {
          email: email,
          password: password,
          password_confirmation: password_confirmation,
        }
      }

      response = TeachableAPIWrapper::Fetcher.post('/users.json', data)
      JSON.parse(response.body)
    end

    def self.authenticate(email, password)
      data = {
        user: {
          email: email,
          password: password,
        }
      }

      response = TeachableAPIWrapper::Fetcher.post('/users/sign_in.json', data)
      JSON.parse(response.body)
    end

    def self.user_info(email, auth_token)
      data = {
        email: email,
        auth_token: auth_token,
      }

      response = TeachableAPIWrapper::Fetcher.get('/api/users/current_user/edit.json', data)
      JSON.parse(response.body)
    end
  end
end
