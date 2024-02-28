class Converter < ApplicationRecord
  validates :base_currency, :target_currency, presence: true
end
