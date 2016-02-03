require 'rails_helper'

describe PastPriceRecord do
  it {is_expected.to monetize(:price)}
end
