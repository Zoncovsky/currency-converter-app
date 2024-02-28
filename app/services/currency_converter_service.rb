class CurrencyConverterService
  require 'net/http'
  require 'json'

  def fetch_exchange_rate(base_currency, target_currency)
    api_key = 'e9a4fb4bff31483fb2af881cb084ddf9'
    url = "https://openexchangerates.org/api/latest.json?app_id=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    rates = JSON.parse(response)['rates']
  
    base_rate = rates[base_currency]
    target_rate = rates[target_currency]
  
    if base_rate && target_rate
      conversion_rate = target_rate / base_rate
      return conversion_rate
    else
      return nil
    end
  end
  
  def convert_currency(amount, base_currency, target_currency)
    conversion_rate = fetch_exchange_rate(base_currency, target_currency)

    if conversion_rate
      converted_amount = amount * conversion_rate
      return converted_amount.round(2)
    else
      return nil
    end
  end
end
