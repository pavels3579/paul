puts "Как Вас зовут?"
name = gets.chomp
puts "Какой у Вас рост?"
height = gets.chomp
weight = height.to_i - 110
if weight >= 0 
	puts "#{name}, Ваш идеальный вес #{weight} кг"
else
	puts "Ваш вес уже оптимальный"
end