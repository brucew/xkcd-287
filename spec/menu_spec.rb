require_relative '../menu'

describe Menu, '#new' do
  before do
    @menuitem1 = Menu.new('sample1.txt')
  end

  it 'populates a target price' do
    @menuitem1.target_price.should == 1505
  end

  it 'populates fruit items' do
    @menuitem1.items[0].should == { name: 'mixed fruit', price: 215 }
    @menuitem1.items[5].should == { name: 'sampler plate', price: 580 }
  end
end

describe Menu, '#get_combos' do
  before do
    @possible_menuitem      = Menu.new("spec/possible.txt")
    @impossible_menuitem    = Menu.new("spec/impossible.txt")
    @possible_combinations   = @possible_menuitem.combinations
    @impossible_combinations = @impossible_menuitem.combinations
  end

  it 'creates combinations' do
    @possible_combinations.include?([{:name=>"walnut", :price=>500}, {:name=>"acorn", :price=>500}]).should == true
    @possible_combinations.include?([{:name=>"cashew", :price=>200}, {:name=>"almond", :price=>800}]).should == true
    @impossible_combinations.count.should == 0
  end
end

describe Menu, '#show_results' do

  before do
    @winner = Menu.new("spec/possible.txt")
    @loser  = Menu.new("spec/impossible.txt")
  end

  it 'shows the winning combinations' do
    @winner.show_results.include?("Greetings. Here are your 5 winning menu combinations").should == true
    @loser.show_results.include?("Looks like we can't make anything happen with the current menu / budget. Sorry.").should == true
  end

end
