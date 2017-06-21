require 'rspec'
require 'json'
require_relative '../../teachable_api_wrapper/orders'

RSpec.describe TeachableAPIWrapper::Orders do
  describe '.all' do
    let(:response) { TeachableAPIWrapper::Orders.all('any@test.com', 'password') }

    it 'returns all of the ordered' do
      mock_response = double(body: [].to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:get).and_return(mock_response)

      expect(response).not_to include 'errors'
    end

    it 'returns errors not authenticated' do
      mock_response = double(body: {errors: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:get).and_return(mock_response)

      expect(response).to include 'errors'
    end
  end

  describe '.create' do
    let(:response) { TeachableAPIWrapper::Orders.create('any@test.com', '1.25', '1', 'Add pickles!', 'auth_token') }

    it 'returns all of the ordered' do
      mock_response = double(body: {}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:post).and_return(mock_response)

      expect(response).not_to include 'errors'
    end

    it 'returns errors not authenticated' do
      mock_response = double(body: {errors: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:post).and_return(mock_response)

      expect(response).to include 'errors'
    end
  end

  describe '.delete' do
    let(:response) { TeachableAPIWrapper::Orders.delete('order_id', 'any@test.com', 'auth_token') }

    it 'returns all of the ordered' do
      mock_response = double(body: [].to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:delete).and_return(mock_response)

      expect(response).not_to include 'errors'
    end

    it 'returns errors not authenticated' do
      mock_response = double(body: {errors: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:delete).and_return(mock_response)

      expect(response).to include 'errors'
    end
  end
end
