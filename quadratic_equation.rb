#quadratic_equation
puts "Введите коэффициент a"
a = gets.chomp
puts "Введите коэффициент b"
b = gets.chomp
puts "Введите коэффициент c"
c = gets.chomp

discriminant = b.to_i**2 - 4*a.to_i*c.to_i

if discriminant > 0
	x1 = (-b.to_i + Math.sqrt(discriminant))/2*a.to_i
	x2 = (-b.to_i - Math.sqrt(discriminant))/2*a.to_i
	puts "Значение дискриминанта равно #{discriminant.to_s}"
	puts "Первый корень равен #{x1.to_s}"
	puts "Второй корень равен #{x2.to_s}"
elsif discriminant == 0
	x1 = (-b.to_i)/2*a.to_i	
	puts "Значение дискриминанта равно #{discriminant.to_s}"
	puts "Корень равен #{x1.to_s}"
else
	puts "Значение дискриминанта равно #{discriminant.to_s}"
	puts "Корней нет"
end
	

	