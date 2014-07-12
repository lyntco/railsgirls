def roman(n)
  thousands = n.divmod(1000).first
  hundreds = n.divmod(1000).last.divmod(100).first
  tens, ones = n.divmod(1000).last.divmod(100).last.divmod(10)
  # thousands = { n.divmod(1000).first => ["M"] }
  # hundreds = { n.divmod(1000).last.divmod(100).first => ["D","C"] }
  # tens = { n.divmod(1000).last.divmod(100).last.divmod(10).first => ["L","D"] }
  # ones = { n.divmod(1000).last.divmod(100).last.divmod(10).last => ["V","I"] }
  # ones_letters =["V","I"]
  # first = ["D", "L", "V"]
  # second = ["C", "X", "I"]
  str = ""

  # [thousands,hundreds,tens,ones].each do |magnitude|
  #   magnitude.each do |n,letters|
  #     modres = n % 5
  #     str += letters[0] if n >= 5
  #     str += letters[-1] * modres
  #   end
  # end

  str += "M" * thousands

  modreshuns = hundreds % 5
    str += "D" if hundreds >= 5
    str += "C" * modreshuns

  modrestens = tens % 5
    str += "L" if tens >= 5
    str += "X" * modrestens

  modresones = ones % 5
    str += "V" if ones >= 5
    str += "I" * modresones

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