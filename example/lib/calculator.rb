class Calculator
  def sum(*numbers)
    numbers.inject(:+)
  end
end