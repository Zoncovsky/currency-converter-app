class CreateConverters < ActiveRecord::Migration[7.0]
  def change
    create_table :converters do |t|
      t.string :base_currency
      t.string :target_currency
      t.decimal :amount, precision: 12, scale: 2

      t.timestamps
    end
  end
end
