def parse_price(price)
  #sometimes people put a leading space after a comma in a CSV
  #This first line will strip that off just-in-case
  price.gsub!(' ', '')
  (price.gsub!('$','').to_f*100).to_i
end
