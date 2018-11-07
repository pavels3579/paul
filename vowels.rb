vowels = %w(a e i o u y)

my_hash = {}

('a'..'z').each.with_index(1) do |letter, index|
	if vowels.include?(letter)
		my_hash[letter.to_sym] = index	
	end	
end

puts my_hash
