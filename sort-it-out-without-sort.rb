words = []
input = nil
output = []

while input != ""
  input = gets.chomp
  if input != ""
    words.push(input)
  end
end

words.length.times do
  output.push(words.min)
  words.delete(words.min)
end

puts output
