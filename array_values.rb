my_array = []
index = 10
while index <= 100 do
	my_array.push(index) if index % 5 == 0
	index += 1
end

puts my_array
