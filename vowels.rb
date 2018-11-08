vowels = %w(a e i o u y)

my_hash = {}

('a'..'z').each.with_index(1) do |letter, index|	
  my_hash[letter.to_sym] = index if vowels.include?(letter)			
end

puts my_hash
