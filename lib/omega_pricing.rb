class OmegaPricing
  attr_reader :api_key

  def initialize(api_key, base_url: "https://omegapricinginc.com")
    @api_key = api_key
    @base_url = base_url
  end

  def get_pricing_records(start_date, end_date)
    result = RestClient.get("#{base_url}/pricing/records.json",
      params: {
        api_key: api_key,
        start_date: format_date(start_date),
        end_date: format_date(end_date)
      }
    )

    # TODO refactor for error handling
    JSON.parse(result.to_str, symbolize_names: true).fetch(:productRecords)
  end

  private
  attr_reader :base_url

  def format_date(date)
    date.to_s
  end
end
