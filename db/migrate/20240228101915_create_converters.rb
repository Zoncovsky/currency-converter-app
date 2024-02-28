class CreateConverters < ActiveRecord::Migration[7.0]
  def change
    create_table :converters do |t|
      t.decimal :base_currency, precision: 12, scale: 2
      t.decimal :target_currency, precision: 12, scale: 2

      t.timestamps
    end
  end
end
