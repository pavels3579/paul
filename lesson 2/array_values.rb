my_array = []
index = 10
(10 .. 100).each {|n| my_array.push(n) if n % 5 == 0}

puts my_array
