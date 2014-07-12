def roman(n)
  thousands = { n.divmod(1000).first => "M" }
  hundreds = { n.divmod(1000).last.divmod(100).first => ["D","C"] }
  tens = { n.divmod(1000).last.divmod(100).last.divmod(10).first => ["L","X"] }
  ones = { n.divmod(1000).last.divmod(100).last.divmod(10).last => ["V","I"] }
  str = ""

  str += thousands.values.first * thousands.keys.first

  [hundreds,tens,ones].each do |magnitude|
    magnitude.each do |amount,letters|
      modres = amount % 5
      str += letters[0] if amount >= 5
      str += letters[-1] * modres
    end
  end

  str
end

require "minitest"
require "minitest/spec"
require "minitest/autorun"

describe "roman" do
  [
    [1,"I"],
    [2,"II"],
    [3,"III"],
    [4,"IIII"],
    [5,"V"],
    [6,"VI"],
    [7,"VII"],
    [10,"X"],
    [14,"XIIII"],
    [19,"XVIIII"],
    [22,"XXII"],
    [36,"XXXVI"],
    [51,"LI"],
    [50,"L"],
    [78, "LXXVIII"],
    [100,"C"],
    [671,"DCLXXI"],
    [1000,"M"],
    [5000,"MMMMM"],
    [5803,"MMMMMDCCCIII"]
  ].each do |input,out|

    it "converts the number #{input} to the string #{out}" do
      roman(input).must_equal "#{out}"
    end

  end
end