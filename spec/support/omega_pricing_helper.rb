module OmegaPricingHelper
  def stub_omega_pricing_request(records=[])
    stub_request(:get, "https://omegapricinginc.com/pricing/records.json")
      .with(query: hash_including({}))
      .to_return(
        body: build_records_response(records)
      )
  end

  private

  def build_records_response(records)
    {
      "productRecords" =>  records.map{|r| set_default_product_values(r)}
    }.to_json
  end

  def set_default_product_values(overrides={})
    {
      id: 123456,
      name: "Nice Chair",
      price: "$30.25",
      category: "home-furnishings",
      discontinued: false
    }.merge(overrides)
  end
end
