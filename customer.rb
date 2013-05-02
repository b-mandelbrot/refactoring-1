class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end
  def add_rental(args)
    @rentals << args
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{name}:"

    @rentals.each do |rental|
      # show figures for this rental
      result += " Title: #{rental.movie.title}  Total Amount: #{rental.charge.to_s}"
    end

    # add footer lines
    result += " Amount owned is: #{total_charge} "
    result += " You earned: #{total_frequent_renter_points} frequent renter points"
    result
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end
