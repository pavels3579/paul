puts "Как Вас зовут?"
name = gets.chomp.capitalize
puts "Какой у Вас рост?"
height = gets.chomp.to_i
weight = height - 110
if weight >= 0 
	puts "#{name}, Ваш идеальный вес #{weight} кг"
else
	puts "Ваш вес уже оптимальный"
end
