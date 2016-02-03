require 'rails_helper'

describe PricingImport do
  describe ".run" do
    context "when importing a product with a matching external_product_id and name" do
      it "updates the product's price  and creates a new past price record" do
        stub_omega_pricing_request([{id: 1432, name: "Widget", price: "$15.00"}])
        product = create :product, external_product_id: 1432, product_name: "Widget", price: "$12.47"

        expect {
          PricingImport.run
        }.to change(product.past_price_records, :count).by(1)
      end
    end
  end
end
