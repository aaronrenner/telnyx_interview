require "rails_helper"

describe OmegaPricing do
  let(:api_key) { "abc_123" }

  describe "#get_pricing_records" do
    let(:start_date) { Date.current - 12.days }
    let(:end_date) { Date.current - 6.days }
    it "makes a get call to the correct url" do
      stub = stub_request(:get, "https://omegapricinginc.com/pricing/records.json")
        .with(query: {api_key: api_key, start_date: start_date.to_s, end_date: end_date.to_s})

      client = described_class.new(api_key)
      client.get_pricing_records(start_date, end_date)

      expect(stub).to have_been_made
    end

    it "returns the response in the correct format" do
      sample_response = {
        id: 123456,
        name: "Nice Chair",
        price: "$30.25",
        category: "home-furnishings",
        discontinued: false
      }
      stub_omega_pricing_request([sample_response])

      client = described_class.new(api_key)

      expect(client.get_pricing_records(start_date, end_date)).to eq([sample_response])
    end
  end
end
