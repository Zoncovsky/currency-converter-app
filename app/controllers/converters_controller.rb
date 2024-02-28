class ConvertersController < ApplicationController
  def index
    amount = params[:amount].to_f
    base_currency = params[:base_currency]
    target_currency = params[:target_currency]

    converter_service = CurrencyConverterService.new
    @converted_amount = converter_service.convert_currency(amount, base_currency, target_currency)
  end
end
