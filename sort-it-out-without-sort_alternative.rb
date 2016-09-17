words = []
words_sorted = []
new_word = nil

while new_word != ""
  new_word = gets.chomp
  if new_word != ""
    words.push new_word
  end
end

words.each do |word|

  array_place = 0
  words.each do |word_check|

   if word > word_check
    array_place +=1
   end
  end
  words_sorted[array_place] = word
end

puts words_sorted
