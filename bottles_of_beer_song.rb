item = "bottle"
content = "beer"
s = "s"
zero = "no more"
initial_amount = 99
amount = initial_amount

while amount > 0

  first_line = "#{amount} #{item}s of #{content} on the wall,\n#{amount} #{item}s of #{content}."
  second_line = "Take one down and pass it around,\n#{amount - 1} #{item}s of #{content} on the wall."

  if amount > 1
    puts first_line
  else
    puts first_line.gsub(item + s, item)
  end

  if amount > 2
    puts second_line
  elsif amount == 2
    puts second_line.gsub(item + s, item)
  else
    puts second_line.gsub(0.to_s, zero)
  end

  puts ""
  amount -= 1

end

puts first_line.gsub(1.to_s, zero).capitalize
puts "Go to the store and buy some more,\n#{initial_amount} #{item}s of #{content} on the wall."
