require 'test/unit'
require 'new_release_price'

class TestNewReleasePrice < Test::Unit::TestCase

  def setup
    @price_code = NewReleasePrice.new
  end

  def test_charge_when_days_rented_is_1
    assert_equal(3, @price_code.charge(1))
  end

  def test_frequent_rented_points_when_days_rented_is_1
    assert_equal(1, @price_code.frequent_renter_points(1))
  end

  def test_frequent_rented_points_when_days_rented_is_2
    assert_equal(2, @price_code.frequent_renter_points(2))
  end
end
