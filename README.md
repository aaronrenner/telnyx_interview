# Telnyx Interview App

## Getting Started

To start developing the project, cd into this directory and run the following:

```bash
bin/setup
```

## Gems Used

Production gems

* money-rails - Value objects for money. Doesn't make you keep track of if
  amounts are in dollars or cents.
* rest-client - Used for making http requests.

Test gems

* rspec-rails - Rspec testing framework
* webmock - Allows mocking and verifing http requests
* factory_girl - helps with quickly building models for tests

Development Gems

* spring, spring-command-rspec - Rails application preloader that makes running
  tests faster
* dotenv-rails - Allows setting environment variables in a dotenv file. This
  makes it so you don't have to hard code secrets like api keys.
* pry - Allows you to stop the application and inspect the state of the code. I
  used this while trying to figure out some issues with Webmock

## Assumptions

* Date parameters for api are in the YYYY-MM-DD format

## Notes

I ran out of time on this project, but would be happy to continue and finish
what I was thinking.

Here are some thoughts I have about finishing the application

* `OmegaPricing`- This pricing client needs to handle error cases. I am debating
  on whether or not to return a response object that needs to be queried to see
  if it completed successfully, or if I just raise an Error.
    ```ruby
      api_client = OmegaPricing.new(api_key)
      results = api_client.get_pricing_records(start_date, end_date)

      import_results(results)

      # vs.
      api_client = OmegaPricing.new(api_key)
      response = OmegaPricing.get_pricing_records(start_date, end_date)

      if response.success?
        import_results(response.results)
      else
        # deal with the error (log, raise exeception, etc)
      end
    ```
  I am leaning toward returning a response object because it's more obvious to
  the caller that the error case needs to be dealt with.

* `PricingImport` - This class still needs its logic, but would be the main
  command that controls importing pricing records from the OmegaPricing client.
  I'm not sure if `run` will be a class or instance method, yet. If this ends up
  not needing to return much output, then it would probably be fine as a class
  level function. However, if we need to return logs of what happend or other
  additional information, it might be beneficial to have `run` be an instance
  method and treat `PricingImport` as a single use command object.
