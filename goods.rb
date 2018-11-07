goods = {}


loop do 
  puts "Введите название тавара (стоп - прекратить ввод)"
  good_name = gets.chomp.downcase

  break if good_name == "стоп"

  puts "Введите цену за единицу"
  good_price = gets.to_f

  puts "Введите количество купленного тавара"
  good_count = gets.to_f

  if goods[good_name.to_sym].nil? 
    good_values = {}    

    good_values[:price] = good_price
    good_values[:quentity] = good_count
    goods[good_name.to_sym] = good_values
  
  else
    goods[good_name.to_sym][:quentity] = goods[good_name.to_sym][:quentity] + good_count
  end
end

puts goods

sum = 0
goods.each do |good_name, good_value|
  puts "+++ Товар #{good_name}"
  
  price = goods[good_name][:price] 
  count = goods[good_name][:quentity] 
  puts "Цена: #{price} Количество:#{count}"
  good_sum = price * count    
  
  puts "--- Общая сумма за товар #{good_sum}"
  sum += good_sum
end

puts "Общая сумма всех таваров равна #{sum}"
