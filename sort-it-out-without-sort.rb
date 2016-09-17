my_array = []
input = nil
output = []

while input != ""
  input = gets.chomp
  if input != ""
    my_array.push(input)
  end
end

my_array.length.times do
  output.push(my_array.min)
  my_array.delete(my_array.min)
end

puts output

