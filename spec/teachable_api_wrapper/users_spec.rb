require 'rspec'
require 'json'
require_relative '../../teachable_api_wrapper/users'

RSpec.describe TeachableAPIWrapper::Users do
  describe '.authenticate' do
    let(:response) { TeachableAPIWrapper::Users.authenticate('any@test.com', 'password') }

    it 'returns the authenticated user' do
      mock_response = double(body: {user: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:post).and_return(mock_response)

      expect(response).to include 'user'
    end

    it 'returns errors if the user does not exist' do
      mock_response = double(body: {errors: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:post).and_return(mock_response)

      expect(response).to include 'errors'
    end
  end

  describe '.register' do
    let(:response) { TeachableAPIWrapper::Users.register('any@test.com', 'password', 'password') }

    it 'returns a user if the user has been created' do
      mock_response = double(body: {user: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:post).and_return(mock_response)

      expect(response).to include 'user'
    end

    it 'returns errors if the user has been created' do
      mock_response = double(body: {errors: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:post).and_return(mock_response)

      expect(response).to include 'errors'
    end
  end

  describe '.user_info' do
    let(:response) { TeachableAPIWrapper::Users.user_info('any@test.com', 'auth_token') }

    it 'returns a user' do
      mock_response = double(body: {user: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:get).and_return(mock_response)

      expect(response).to include 'user'
    end

    it 'returns errors when not a valid request' do
      mock_response = double(body: {errors: {}}.to_json)
      expect(TeachableAPIWrapper::Fetcher).to receive(:get).and_return(mock_response)

      expect(response).to include 'errors'
    end
  end
end
