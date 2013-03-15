require_relative 'helpers'
require_relative 'menu'

#======User Input======
puts 'Enter the relative filename of the menu textfile: '
filename1  = gets.chomp
menuitem1 = Menu.new(filename1)
puts menuitem1.show_results