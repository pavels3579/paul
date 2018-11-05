puts "Введите длину первой стороны треугольника"
first = gets.to_f ** 2
puts "Введите длину второй стороны треугольника"
second = gets.to_f ** 2
puts "Введите длину третьей стороны треугольника"
third = gets.to_f ** 2

right_triangle = false

if first > second && first > third && first == second + third
  right_triangle = true
elsif second > first && second > third && second == first + third \
 right_triangle = true
elsif third > first && third > second && third == first + second
  right_triangle = true
end

if right_triangle
  puts "Треугольник является прямоугольным" 
else
  puts "Треугольник не является прямоугольным" 
end

isosceles_triangle = false
equilateral_triangle = false

if first == second && first != third
  isosceles_triangle = true
elsif first == third && first != second
  isosceles_triangle = true
elsif second == third && second != first
  isosceles_triangle = true
elsif first == second && second != third
  equilateral_triangle = true
end

if isosceles_triangle
  puts "Треугольник является равнобедренным" 
elsif equilateral_triangle
  puts "Треугольник является равнобедренным и равносторонним" 
else
  puts "Треугольник не является равнобедренным" 
end
