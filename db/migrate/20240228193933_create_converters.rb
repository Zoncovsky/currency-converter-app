class CreateConverters < ActiveRecord::Migration[7.0]
  def change
    create_table :converters do |t|
      t.string :target_currency
      t.decimal :amount

      t.timestamps
    end
  end
end
