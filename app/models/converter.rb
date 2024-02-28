class Converter < ApplicationRecord
  validates :base_currency,
            :target_currency,
            :amount,
            presence: true
end
