require_relative 'helpers'
class Menu
  attr_accessor :target_price
  attr_accessor :items
  attr_reader   :combinations
  def initialize(csv_file = nil)
    @target_price = 0 
    @items        = []
    self.populate_data!(csv_file) if csv_file
  end

  def populate_data!(csv_file)
    self.items = []
    File.open(csv_file).each_with_index do |line, index|      
      if index == 0
        self.target_price = parse_price(line)
      else
        item    = line.split(',')
        item[1] = parse_price(item[1])
        item    = {name: item[0], price: item[1]}
        self.items << item
      end
    end
    self.get_combos
    return self
  end

  def get_combos
    @combinations = []
    #First round of guessing: Make combinations
    #BETER IDEA: make each possible combo an array of 6 duplicate menu items so that more combinations are possible.
    #More resource intensive but more accurate
    (1...(@items.count)).each do |count|
        @items.combination(count).to_a.each do |combo_nominee|
          @combinations << combo_nominee if combo_nominee.map{|x| x[:price]}.inject(:+) == @target_price
        end
    end

    #second round of guessing: add multiples together until they == @target price
    (0...(@items.count)).each do |item_index|
      if (@target_price % @items[item_index][:price]) == 0
        quatity = 0
        until ( @items[item_index][:price] * quatity ) == @target_price
          quatity = quatity + 1
        end
        @combinations << [@items[item_index]]*quatity
      end
    end

  end

  def show_results
    results = ""
    if (@combinations != [])
    results << "Greetings. Here are your #{@combinations.count} winning menu combinations\n"
      @combinations.each do |x|
        x.each{|y|results << y[:name] + "\n"}
        results << "==========\n"
      end
    else
    results << "Looks like we can't make anything happen with the current menu / budget. Sorry.\n"
    end
    results
  end

end

