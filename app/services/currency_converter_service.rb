require 'net/http'
require 'json'

class CurrencyConverterService
  API_KEY = 'e9a4fb4bff31483fb2af881cb084ddf9'.freeze
  EXCHANGE_RATE_URL = "https://openexchangerates.org/api/latest.json?app_id=#{API_KEY}".freeze

  def initialize
    @cached_rates = {}
  end

  def fetch_exchange_rate(base_currency, target_currency)
    rates = fetch_rates
    return nil unless rates

    base_rate = rates[base_currency]
    target_rate = rates[target_currency]

    return nil unless base_rate && target_rate

    target_rate / base_rate
  end

  def convert_currency(amount, base_currency, target_currency)
    conversion_rate = fetch_exchange_rate(base_currency, target_currency)

    return nil unless conversion_rate

    (amount * conversion_rate).round(2)
  end

  private

  def fetch_rates
    return @cached_rates unless @cached_rates.empty?

    response = Net::HTTP.get_response(URI(EXCHANGE_RATE_URL))
    return nil unless response.is_a?(Net::HTTPSuccess)

    @cached_rates = JSON.parse(response.body)['rates']
  rescue StandardError => e
    puts "Error fetching exchange rates: #{e.message}"
    nil
  end
end
