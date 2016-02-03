require "spec_helper"

describe OmegaPricing do
  let(:api_key) { "abc_123" }

  describe "#get_pricing_records" do
    it "makes a get call to the correct url" do
      start_date = Date.current - 12.days
      end_date = Date.current - 6.days

      stub = stub_request(:get, "https://omegapricinginc.com/pricing/records.json")
        .with(query: {api_key: api_key, start_date: start_date.to_s, end_date: end_date.to_s})

      client = described_class.new(api_key)
      client.get_pricing_records(start_date, end_date)

      expect(stub).to have_been_made
    end
  end
end
