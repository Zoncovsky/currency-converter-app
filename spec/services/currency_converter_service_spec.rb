require 'rails_helper'
require 'webmock/rspec'

RSpec.describe CurrencyConverterService do
  describe '#fetch_exchange_rates' do
    let(:service) { CurrencyConverterService.new }

    it 'returns exchange rates for the given base currency' do
      base_currency = 'USD'

      stub_request(:get, "https://v6.exchangerate-api.com/v6/#{CurrencyConverterService::API_KEY}/latest/#{base_currency}")
        .to_return(status: 200, body: '{"conversion_rates":{"EUR":0.85,"GBP":0.75}}', headers: {})

      expect(service.fetch_exchange_rates(base_currency)).to eq({ 'EUR' => 0.85, 'GBP' => 0.75 })
    end
  end

  describe '#exchange_rate' do
    let(:service) { CurrencyConverterService.new }

    it 'returns the exchange rate between base and target currencies' do
      base_currency = 'USD'
      target_currency = 'EUR'
      allow(service).to receive(:fetch_exchange_rates).and_return({ 'EUR' => 0.85, 'GBP' => 0.75 })

      expect(service.exchange_rate(base_currency, target_currency)).to eq(0.85)
    end
  end

  describe '#convert_currency' do
    let(:service) { CurrencyConverterService.new }

    it 'returns the converted amount based on exchange rate' do
      amount = 100
      base_currency = 'USD'
      target_currency = 'EUR'
      allow(service).to receive(:exchange_rate).and_return(0.85)

      expect(service.convert_currency(amount, base_currency, target_currency)).to eq(85)
    end
  end
end
