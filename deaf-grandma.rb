respons1 = "HUH?! SPEAK UP, SONNY!"
bye_count = 0

while bye_count < 3

  question = gets.chomp
  if question != question.upcase
    puts respons1
    bye_count = 0
  elsif question == "BYE"
    bye_count += 1
  else
    rand_year = 1930 + rand(20)
    respons2 = "NO, NOT SINCE #{rand_year.to_s}!"
    puts respons2
    bye_count = 0
  end

end
