require 'test/unit'
require 'regular_price'

class TestRegularPrice < Test::Unit::TestCase

  def setup
    @price_code = RegularPrice.new
  end

  def test_charge_1_days_rented
    assert_equal(2, @price_code.charge(1))
  end

  def test_charge_3_days_rented
    assert_equal(3.5, @price_code.charge(3))
  end

  def test_frequent_renter_points
    assert_equal(1, @price_code.frequent_renter_points(1))
  end
end
