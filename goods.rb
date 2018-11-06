goods = Hash.new

loop do 
  puts "Введите название тавара (стоп - прекратить ввод)"
  good_name = gets.chomp.downcase

  break if good_name == "стоп"

  puts "Введите цену за единицу"
  good_price = gets.to_sym

  puts "Введите количество купленного тавара"
  good_count = gets.to_f

  if goods[good_name.to_sym].nil? 
    good_values = Hash.new
    good_values[good_price] = good_count

    goods[good_name.to_sym] = good_values
  elsif goods[good_name.to_sym][good_price].nil?
    goods[good_name.to_sym][good_price] = good_count
  else
    goods[good_name.to_sym][good_price] = goods[good_name.to_sym][good_price] + good_count
  end
end

puts goods

sum = 0
goods.each do |good_name, good_value|
  puts "+++ Товар #{good_name.to_s}"

  good_sum = 0
  goods[good_name].each do |price, count|
    puts "Цена: #{price.to_s} Количество:#{count}"
    good_sum += price.to_s.to_f * count    
  end
  puts "--- Общая сумма за товар #{good_sum}"
  sum += good_sum
end

puts "Общая сумма всех таваров равна #{sum}"
