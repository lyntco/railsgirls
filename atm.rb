def withdraw(amount)
  if amount <= 0 || amount % 5 != 0 # CHECK FOR BOTH INVALIDS INSTEAD OF LATER
    return false
  else
    bills = [20,10,5]
    total_array = []
    bills.each do |bill|
      (amount/bill).times do
        total_array << bill
        amount -= bill
      end
    end
  end
  total_array
end

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [53, false],
    [35, [20, 10, 5]],
    [40, [20, 20]],
    [65, [20, 20, 20, 5]],
    [70, [20, 20, 20, 10]],
    [75, [20, 20, 20, 10, 5]],
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end