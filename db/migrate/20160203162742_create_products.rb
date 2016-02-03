class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :external_product_id, null: false
      t.monetize :price
      t.string :product_name

      t.timestamps null: false
    end
  end
end
