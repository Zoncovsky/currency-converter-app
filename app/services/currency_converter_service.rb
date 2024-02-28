require 'net/http'
require 'json'

class CurrencyConverterService
  API_KEY = '5989573b230a6615ae303f9a'.freeze

  def fetch_exchange_rates(base_currency)
    uri = URI("https://v6.exchangerate-api.com/v6/#{API_KEY}/latest/#{base_currency}")
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    rates = data['conversion_rates']
  end

  def exchange_rate(base_currency, target_currency)
    rates = fetch_exchange_rates(base_currency)

    return rates[target_currency] if rates && rates[target_currency]

    nil
  end

  def convert_currency(amount, base_currency, target_currency)
    rate = exchange_rate(base_currency, target_currency)

    return amount * rate if rate

    nil
  end
end
