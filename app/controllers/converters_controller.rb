class ConvertersController < ApplicationController
  def index
    @user = User.last

    @converted_amount = nil

    return unless params[:base_currency].present? && params[:target_currency].present? && params[:amount].present?

    base_currency = params[:base_currency]
    target_currency = params[:target_currency]
    amount = params[:amount].to_f
    @converted_amount = CurrencyConverterService.new.convert_currency(amount, base_currency, target_currency)
  end
end
