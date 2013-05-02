require 'test/unit'
require 'default_price'

class TestDefaultPrice < Test::Unit::TestCase
  include DefaultPrice

  def test_frequent_renter_points
    assert_equal(1, frequent_renter_points(1))
  end
end
