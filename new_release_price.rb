class NewReleasePrice

  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end

  def charge(days_rented)
    result = 0
    result += days_rented * 3
    result
  end
end
