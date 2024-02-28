module HomeHelper
  def currency_options
    Money::Currency.all.map { |currency| [currency.iso_code] }
  end
end
