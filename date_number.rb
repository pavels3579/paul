months = {
  january: 31, 
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

puts "Введите число"
my_date = gets.to_i

puts "Введите месяц"
my_month = gets.to_i

puts "Введите год"
my_year = gets.to_i

date_number = 0
index = 0
months.each do |key, value|
  index += 1
  break if index == my_month
  date_number += value
end

date_number += my_date
if my_year % 400 == 0 || (my_year % 4 == 0 && my_year % 4 != 0)
  date_number += 1
end

puts "Порядковый номер даты с начала года #{date_number}"
