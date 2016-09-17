words = []
input = nil

while input != ""
  input = gets.chomp
  if input != ""
    words.push(input)
  end
end

words.sort.each do |word|
	puts word
end
