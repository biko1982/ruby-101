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

  while expo > 2
    write = left/(10**expo)
    left  = left - write*(10**expo)

    if write > 0
  	  billions = englishNumber write
  	  numString = numString + billions + illions[expo]

     if left > 0
        numString = numString + ' '
      end

    end
    expo -= 3
  end

  expo  = 2
  write = left/(10**expo)
  left  = left - write*(10**expo)

  if write > 0
    hundreds  = englishNumber write
    numString = numString + hundreds + illions[expo]

    if left > 0
      numString = numString + ' '
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
