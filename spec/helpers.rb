require_relative "../helpers"

describe "parse_price" do
  before do
    @price1 = "$15.55"
    @price2 = "$6.60"
  end

  it "parses the price into a ruby float type" do
    parse_price(@price1).should == 1555
    parse_price(@price2).should == 660
  end
end