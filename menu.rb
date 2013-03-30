require_relative 'helpers'
class Menu
  attr_accessor :target_price
  attr_accessor :items
  attr_reader :combinations

  def initialize(csv_file = nil)
    @target_price = 0
    @items = []
    self.populate_data!(csv_file) if csv_file
  end

  def populate_data!(csv_file)
    self.items = []
    File.open(csv_file).each_with_index do |line, index|
      if index == 0
        self.target_price = parse_price(line)
      else
        item = line.split(',')
        item[1] = parse_price(item[1])
        item = {name: item[0], price: item[1]}
        self.items << item
      end
    end
    self.get_combos
    return self
  end

  # Recursive method to find all item combinations that add up to a specific price exactly
  def recursive_combinations_to_price(items, target_price)
    combinations = []
    items.each do |item|
      case
        when item[:price] < target_price
          new_combinations = recursive_combinations_to_price(items, target_price - item[:price])
          # We need to add our current item to each of the combinations
          # and simultaneously sort the combination so that we can remove duplicates
          new_combinations.collect { |combo| (combo << item).sort_by! { |obj| obj.object_id } }
          combinations += new_combinations
        when item[:price] == target_price
          combinations << [item]
      end
    end
    return combinations.uniq # Here is where we remove duplicates
  end

  # Brute force method to find all item combinations that add up to a specific price exactly
  # This method is both faster and easier to understand than the recursive method
  def brute_force_combinations_to_price(items, target_price)
    combinations = []
    cheapest_item = items.min_by { |item| item[:price] }
    max_combination_length = target_price.div(cheapest_item[:price])

    # Generate all possible combinations of items of any length that could add up to the target price
    (1..max_combination_length).each do |combination_length|
      items.repeated_combination(combination_length).each do |combination|
        # Add combination to the results if the sum of its item prices equals the target price
        combinations << combination if combination.inject(0) { |sum, item| sum + item[:price] } == target_price
      end
    end

    return combinations
  end

  def get_combos(opts={})
    case opts[:method]
      when :recursive
        @combinations = recursive_combinations_to_price(@items, @target_price)
      else
        @combinations = brute_force_combinations_to_price(@items, @target_price)
    end
  end

  def show_results
    results = ""
    if (@combinations != [])
      results << "Greetings. Here are your #{@combinations.count} winning menu combinations\n"
      @combinations.each do |x|
        x.each { |y| results << y[:name] + "\n" }
        results << "==========\n"
      end
    else
      results << "Looks like we can't make anything happen with the current menu / budget. Sorry.\n"
    end
    results
  end

end

