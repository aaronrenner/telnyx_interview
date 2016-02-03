class PricingImport
  def self.run
    api_client = OmegaPricing.new(ENV.fetch('OMEGA_PRICING_API_KEY'))
    result = api_client.get_pricing_records(Date.current, Date.current - 1.month)
  end
end
