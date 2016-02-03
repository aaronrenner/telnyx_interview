class Product < ActiveRecord::Base
  monetize :price_cents
  has_many :past_price_records
end
