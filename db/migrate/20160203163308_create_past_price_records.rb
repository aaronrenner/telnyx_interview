class CreatePastPriceRecords < ActiveRecord::Migration
  def change
    create_table :past_price_records do |t|
      t.belongs_to :product, index: true, foreign_key: true, null: false
      t.monetize :price
      t.string :product_name
      t.float :percent_change, null: false

      t.timestamps null: false
    end
  end
end
