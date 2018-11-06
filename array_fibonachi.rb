my_array = []
index = 1

while index <= 100 do
	if my_array.size == 0 || my_array.size == 1
		my_array.push(1) 
	elsif my_array[my_array.size-2] + my_array.last == index
		my_array.push(index)
	else
		index += 1
	end
end

puts my_array
