months = [ 31, 28, 31, 30, 30, 31, 31, 30, 31, 30, 31 ]

puts "Введите число"
my_date = gets.to_i

puts "Введите месяц"
my_month = gets.to_i

puts "Введите год"
my_year = gets.to_i

date_number = my_date

months.each.with_index(1) do |days, index|  
  break if index == my_month
  date_number += days
end

leap_year = my_year % 400 == 0 || (my_year % 4 == 0 && my_year % 4 != 0)
date_number += 1 if leap_year & (my_month >= 3)

puts "Порядковый номер даты с начала года #{date_number}"
