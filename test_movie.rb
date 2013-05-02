require 'test/unit'
require 'movie'
require 'test_unit_setup'
require 'regular_price'
require 'new_release_price'
require 'childrens_price'

class TestMovie < Test::Unit::TestCase

  def setup
    @movie = Movie.new("Foo Bar", RegularPrice.new)
  end

  def test_attr_reader_title
    @movie.title
  end

  def test_attr_writer_price
    @movie.price = RegularPrice.new
  end

  def test_set_price_code_when_movie_regular
    @movie.price = RegularPrice.new
    assert_instance_of(RegularPrice, @movie.price)
  end

  def test_set_price_code_when_movie_new_release
    @movie.price = NewReleasePrice.new
    assert_instance_of(NewReleasePrice, @movie.price)
  end

  def test_set_price_code_when_movie_childrens
    @movie.price = ChildrensPrice.new
    assert_instance_of(ChildrensPrice, @movie.price)
  end

  def test_charge
    @movie.price = RegularPrice.new
    assert_equal(2, @movie.charge(1))
  end
end
