puts "Введите длину первой стороны треугольника"
first = gets.chomp.to_i
puts "Введите длину второй стороны треугольника"
second = gets.chomp.to_i
puts "Введите длину третьей стороны треугольника"
third = gets.chomp.to_i

right_triangle = false

if (first > second) && (first > third) && (first**2 == (second**2 + third**2))
  right_triangle = true
elsif (second > first) && (second > third) && (second**2 == (first**2 + third**2))
  right_triangle = true
elsif (third > first) && (third > second) && (third**2 == (first**2 + second**2))
  right_triangle = true
end

if right_triangle
  puts "Треугольник является прямоугольным" 
else
  puts "Треугольник не является прямоугольным" 
end

isosceles_triangle = false

if (first == second) && (first != third)
  isosceles_triangle = true
elsif (first == third) && (first != second)
  isosceles_triangle = true
elsif (second == third) && (second != first)
  isosceles_triangle = true
end

if isosceles_triangle
  puts "Треугольник является равнобедренным" 
else
  puts "Треугольник не является равнобедренным" 
end