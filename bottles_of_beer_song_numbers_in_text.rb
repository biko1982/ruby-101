def englishNumber number
  numString = ''

  onesPlace = ['zero',        'one',       'two',      'three',    'four',
               'five',        'six',       'seven',    'eight',    'nine']
  tensPlace = [ nil,          'ten',       'twenty',   'thirty',   'forty',
                'fifty',      'sixty',     'seventy',  'eighty',   'ninety']
  teenagers = [ nil,          'eleven',    'twelve',   'thirteen', 'fourteen',
                'fifteen',    'sixteen',   'seventeen','eighteen', 'nineteen']

  illions =   [ nil,   nil,   ' hundred',  ' thousand',nil,nil,    ' million',
                nil,   nil,   ' billion',              nil,nil,    ' trillion',
				nil,   nil,   ' quadrillion',          nil,nil,    ' quintillion',
				nil,   nil,   ' sextillion',           nil,nil,    ' septillion',
				nil,   nil,   ' octillion',            nil,nil,    ' nonillion',
				nil,   nil,   ' decillion',            nil,nil,    ' undecillion',
				nil,   nil,   ' duodecillion',         nil,nil,    ' tredecillion',
				nil,   nil,   ' quattuordecillion',    nil,nil,    ' quindecillion',
				nil,   nil,   ' sexdecillion',         nil,nil,    ' septendecillion',
				nil,   nil,   ' octodecillion',        nil,nil,    ' novemdecillion',
				nil,   nil,   ' vigintillion'
				]

  if number < 0
    return 'Please enter a number that isn\'t negative.'
  elsif number > (10**66) - 1
    return 'Your number is bigger than 999 vigintillion. Are you crazy?'
  elsif number == 0
    return onesPlace[number]
  end

  left  = number

  expo  = number.to_s.length
  expo  = expo - (expo % 3)

  while expo > 1
    write = left/(10**expo)
    left  = left - write*(10**expo)

    if write > 0
  	  billions = englishNumber write
  	  numString = numString + billions + illions[expo]

     if left > 0
        numString = numString + ' '
      end

    end
    if expo > 3
      expo -= 3
    else
      expo -= 1
    end
  end

  write = left/10
  left  = left - write*10

  if write > 0
    if ((write == 1) and (left > 0))

      numString = numString + teenagers[left]
      left = 0
    else
      numString = numString + tensPlace[write]

    end

    if left > 0
      numString = numString + '-'
    end
  end

  write = left
  left  = 0

  if write > 0
    numString = numString + onesPlace[write]

  end


  numString

end

item = "bottle"
content = "beer"
s = "s"
zero = "no more"
initial_amount = 9999
amount = initial_amount

while amount > 0

  first_line = "#{englishNumber(amount)} #{item}s of #{content} on the wall,\n#{englishNumber(amount)} #{item}s of #{content}.".capitalize
  second_line = "Take one down and pass it around,\n#{englishNumber(amount - 1)} #{item}s of #{content} on the wall."

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
    puts second_line.gsub("zero", zero)
  end

  puts ""
  amount -= 1

end

puts first_line.gsub(/One/i, zero).capitalize
puts "Go to the store and buy some more,\n#{englishNumber(initial_amount)} #{item}s of #{content} on the wall."
