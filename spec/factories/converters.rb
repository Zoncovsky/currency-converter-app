FactoryBot.define do
  factory :converter do
    target_currency { 'MyString' }
    amount { '9.99' }
  end
end
