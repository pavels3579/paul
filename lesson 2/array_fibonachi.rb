my_array = [1, 1]
index = 1

while index <= 100 do
	if my_array[-2] + my_array[-1]  == index
		my_array.push(index)
	else
		index += 1
	end
end

puts my_array
