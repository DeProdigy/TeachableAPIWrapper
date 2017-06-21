require 'rspec'
require_relative '../../teachable_api_wrapper/fetcher'

RSpec.describe TeachableAPIWrapper::Fetcher do
  describe '.post' do
    context '/users.json' do
      it 'returns response body with status code' do
        data = {
          user: {
            email: 'dev-8@example.com',
            password: 'password',
            password_confirmation: 'password',
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
            email: 'dev-8@example.com',
            password: 'password',
          }
        }
        response = TeachableAPIWrapper::Fetcher.post('/users/sign_in.json', data)

        expect(response.code).to eql '201'
      end
    end

    context '/api/orders.json' do
      it 'returns response body with status code' do
        data = {
          order: {
            total: '3.00',
            total_quantity: '3',
            email: 'dev-8@example.com',
            special_instructions: 'Add pickles please',
          },
          user_email: 'dev-8@example.com',
          user_token: 'qC3v3HvBfKxCQuyqu49g',
        }
        response = TeachableAPIWrapper::Fetcher.post('/api/orders.json', data)

        expect(response.code).to eql '200'
      end
    end
  end

  describe '.get' do
    context '/api/users/current_user/edit.json' do
      it 'returns response body with status code' do
        auth_data = {
          user_email: 'dev-8@example.com',
          user_token: 'qC3v3HvBfKxCQuyqu49g',
        }
        response = TeachableAPIWrapper::Fetcher.get('/api/users/current_user/edit.json', auth_data)

        expect(response.code).to eql '200'
      end
    end

    context '/api/orders.json' do
      it 'returns response body with status code' do
        data = {
          user_email: 'dev-8@example.com',
          user_token: 'qC3v3HvBfKxCQuyqu49g',
        }
        response = TeachableAPIWrapper::Fetcher.get('/api/orders.json', data)

        expect(response.code).to eql '200'
      end
    end
  end

  describe '.delete' do
    context '/api/orders/:id.json' do
      it 'returns response body with status code' do
        data = {
          order: {
            total: '3.00',
            total_quantity: '3',
            email: 'dev-8@example.com',
            special_instructions: 'Add pickles please',
          },
          user_email: 'dev-8@example.com',
          user_token: 'qC3v3HvBfKxCQuyqu49g',
        }
        new_order = JSON.parse(TeachableAPIWrapper::Fetcher.post('/api/orders.json', data).body)
        auth_data = {
          user_email: 'dev-8@example.com',
          user_token: 'qC3v3HvBfKxCQuyqu49g',
        }
        response = TeachableAPIWrapper::Fetcher.delete("/api/orders/#{new_order['id']}.json", auth_data)

        expect(response.code).to eql '204'
      end
    end
  end
end
