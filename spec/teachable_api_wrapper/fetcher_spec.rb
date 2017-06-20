require 'rspec'
require 'pry'
require_relative '../../teachable_api_wrapper/fetcher'

RSpec.describe TeachableAPIWrapper::Fetcher do
  describe '.post' do
    context '/users.json' do
      it 'returns response body with status code' do
        data = {
          user: {
            email: "dev-8@example.com",
            password: "password",
            password_confirmation: "password",
          }
        }
        response = TeachableAPIWrapper::Fetcher.post('/users.json', data)

        expect(response.code).to eql '422'
      end
    end

    context '/users/sign_in.json' do
      it 'returns response body with status code' do
        data = {
          user: {
            email: "dev-8@example.com",
            password: "password",
          }
        }
        response = TeachableAPIWrapper::Fetcher.post('/users/sign_in.json', data)

        expect(response.code).to eql '201'
      end
    end
  end

  describe '.get' do
    context '/api/users/current_user/edit.json' do
      it 'returns response body with status code' do
        data = {
          user_email: 'dev-8@example.com',
          user_token: 'qC3v3HvBfKxCQuyqu49g',
        }
        response = TeachableAPIWrapper::Fetcher.get('/api/users/current_user/edit.json', data)

        expect(response.code).to eql '200'
      end
    end
  end
end
