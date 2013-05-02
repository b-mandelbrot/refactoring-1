require 'test/unit'
require 'rental'

class TestRental < Test::Unit::TestCase

  def setup
    @rental = Rental.new("batman", 3)
  end

  def test_attr_reader_movie
   @rental.movie
  end

  def test_attr_reader_days_rented
    @rental.days_rented
  end
end
