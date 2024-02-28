require 'rails_helper'
require 'webmock/rspec'

RSpec.describe ConvertersController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }

    before do
      allow(User).to receive(:last).and_return(user)
    end

    context 'when params are present' do
      let(:base_currency) { 'USD' }
      let(:target_currency) { 'EUR' }
      let(:amount) { '100' }

      it 'sets @user' do
        stub_request(:get, /v6.exchangerate-api.com\/v6\/.+/)
          .to_return(status: 200, body: '{"conversion_rates":{"EUR":0.85,"GBP":0.75}}', headers: {})

        get :index, params: { base_currency: base_currency, target_currency: target_currency, amount: amount }
        expect(assigns(:user)).to eq(user)
      end

      it 'sets @converted_amount' do
        stub_request(:get, /v6.exchangerate-api.com\/v6\/.+/)
          .to_return(status: 200, body: '{"conversion_rates":{"EUR":0.85,"GBP":0.75}}', headers: {})

        get :index, params: { base_currency: base_currency, target_currency: target_currency, amount: amount }
        expect(assigns(:converted_amount)).to eq(85.0)
      end
    end

    context 'when params are missing' do
      it 'does not set @converted_amount' do
        get :index
        expect(assigns(:converted_amount)).to be_nil
      end
    end
  end
end
