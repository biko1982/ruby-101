my_array = []
input = nil

while input != ""
  input = gets.chomp
  if input != ""
    my_array.push(input)
  end
end

my_array.sort.each do |word|
	puts word
end
