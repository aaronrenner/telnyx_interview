require 'rails_helper'

describe Product do
  it {is_expected.to monetize(:price)}
end
