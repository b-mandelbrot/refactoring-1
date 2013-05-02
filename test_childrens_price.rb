require 'test/unit'
require 'childrens_price'

class TestChildrensPrice < Test::Unit::TestCase

  def setup
    @price_code = ChildrensPrice.new
  end

  def test_charge_when_days_rented_is_1
    assert_equal(1.5, @price_code.charge(1))
  end

  def test_charge_when_days_rented_is_4
    assert_equal(3.0, @price_code.charge(4))
  end

  def test_frequent_renter_points_when_days_rented_is_1
    assert_equal(1, @price_code.frequent_renter_points(1))
  end
end
