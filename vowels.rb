letters = ('a'..'z').to_a

vowels = ['a', 'e', 'i', 'o', 'u', 'y']

my_hash = Hash.new

index = 0
while index < letters.size do
	if vowels.include?(letters[index])
		my_hash[(letters[index]).to_sym] = index + 1		
	end

	index += 1
end

puts my_hash
