#quadratic_equation
puts "Введите коэффициент a"
a = gets.to_f
puts "Введите коэффициент b"
b = gets.to_f
puts "Введите коэффициент c"
c = gets.to_f

discriminant = b ** 2 - 4 * a * c

if discriminant > 0
  radical = Math.sqrt(discriminant)

  x1 = (-b + radical) / (2 * a)
  x2 = (-b - radical) / (2 * a)
  puts "Значение дискриминанта равно #{discriminant}"
  puts "Первый корень равен #{x1}"
  puts "Второй корень равен #{x2}"
elsif discriminant == 0
  x1 = (-b) / (2 * a)
  puts "Значение дискриминанта равно #{discriminant}"
  puts "Корень равен #{x1}"
else
  puts "Значение дискриминанта равно #{discriminant}"
  puts "Корней нет"
end
