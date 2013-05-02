require 'test/unit'
require 'customer'
require 'rental'
require 'movie'
require 'regular_price'
require 'new_release_price'
require 'childrens_price'

class TestCustomer < Test::Unit::TestCase

  def setup
    @customer = Customer.new("Foo Bar")
  end

  def test_new_customer
    assert_equal("Foo Bar", @customer.name)
  end

  def test_attr_reader_name
    @customer.name
  end

  def test_add_rental
    rental = Object.new
    @customer.add_rental(rental)
  end

  def test_statement_price_code_regular_and_days_rental_is_1
    movie = Movie.new("Foo Bar Movie", RegularPrice.new)
    rental = Rental.new(movie, 1)

    @customer.add_rental(rental)
    assert_equal("Rental Record for Foo Bar: Title: Foo Bar Movie  Total Amount: 2 Amount owned is: 2  You earned: 1 frequent renter points", @customer.statement)
  end

  def test_statement_price_code_regular_and_days_rental_is_3
    movie = Movie.new("Foo Bar Movie", RegularPrice.new)
    rental = Rental.new(movie, 3)

    @customer.add_rental(rental)
    assert_equal("Rental Record for Foo Bar: Title: Foo Bar Movie  Total Amount: 3.5 Amount owned is: 3.5  You earned: 1 frequent renter points", @customer.statement)
  end

  def test_statement_price_code_new_release_and_days_rental_is_1
    movie = Movie.new("Foo Bar Movie", NewReleasePrice.new)
    rental = Rental.new(movie, 1)

    @customer.add_rental(rental)
    assert_equal("Rental Record for Foo Bar: Title: Foo Bar Movie  Total Amount: 3 Amount owned is: 3  You earned: 1 frequent renter points", @customer.statement)
  end

  def test_statement_price_code_new_release_and_days_rental_is_2
    movie = Movie.new("Foo Bar Movie", NewReleasePrice.new)
    rental = Rental.new(movie, 2)

    @customer.add_rental(rental)
    assert_equal("Rental Record for Foo Bar: Title: Foo Bar Movie  Total Amount: 6 Amount owned is: 6  You earned: 2 frequent renter points", @customer.statement)
  end

  def test_statement_price_code_childrens_and_days_rental_is_1
    movie = Movie.new("Foo Bar Movie", ChildrensPrice.new)
    rental = Rental.new(movie, 1)

    @customer.add_rental(rental)
    assert_equal("Rental Record for Foo Bar: Title: Foo Bar Movie  Total Amount: 1.5 Amount owned is: 1.5  You earned: 1 frequent renter points", @customer.statement)
  end

  def test_statement_price_code_childrens_and_days_rental_is_4
    movie = Movie.new("Foo Bar Movie", ChildrensPrice.new)
    rental = Rental.new(movie, 4)

    @customer.add_rental(rental)
    assert_equal("Rental Record for Foo Bar: Title: Foo Bar Movie  Total Amount: 3.0 Amount owned is: 3.0  You earned: 1 frequent renter points", @customer.statement)
  end
end
