class OrangeTree

  def initialize
  	@height    = 0
  	@maxHeight = 900 - rand(300)
  	@oranges   = 0
  	@year      = 0
  	@stock     = 0
  	@commands = { "help"    => ["help",          "    : Shows this list"],
  	              "q"       => ["q",             "       : Quit"],
  	              "pick"    => ["pickAnOrange",  "    : Pick an orange."],
  	              "harvest" => ["harvest",       " : Harvest all oranges, and put them in stock"],
  	              "count"   => ["countOranges",  "   : Shows how many oranges are left on the tree"],
  	              "stock"   => ["countStock",    "   : Shows how many oranges are left in stock"],
  	              "next"    => ["oneYearPasses", "    : Moves on to the next year"],
  	              "party"   => ["party",         "   : Throw a 'Orange Party'"],
  		          "eat"     => ["eat",           "     : Eat oranges"]	}
  	puts "You have planted an orange tree. It can get up to #{@maxHeight} centimetres high! Let\'s see how it goes."
  	puts "Use the .play method to, uh well, play ;-)"

  end

  def inspect	#suppress output to console
    nil
  end

  def play
    @exit = false
	puts "(Enter 'help' for all possible commands)"
    while @exit == false
      getInput
      doAction(@input)
      puts ""
    end
  end

  def showMaxHeight
  	return @maxHeight
  end

  def showHeight
  	"Your tree is now #{@height.to_f / 100} metres high."
  end

  def oneYearPasses
    @year   += 1
    if @year < 4
      @growth = rand(30) + 15
    else
      @growth = rand(10) + 5
    end
    if @height < @maxHeight - @growth
      @height += @growth
    else
      @height = @maxHeight
    end
    puts "A year passes by. #{showHeight}"
    if @year > 3 and @height > 90
      @lessOranges = 0
      if @oranges > 0
      	@oranges = 0
      	puts "You should have harvested last year. This year it will produce less than normal."
      	@lessOranges = rand(100)
      end
      if @lessOranges > @oranges
        @producedOranges = 0
      else
      	@producedOranges = rand(300) - @lessOranges + rand(150)
      end
      @oranges += @producedOranges
      if @oranges == 0
      	puts "No oranges this year, to bad."
      else
      	puts "Your tree has produced #{plural(@oranges)} this year. Awesome!"
      end
    end


  end

  def party
  	print "How many people are joining you?:"
  	@guests = gets.chomp.to_i
  	if @guests + 1 > @stock
  	  puts "Nice party, but next time invite less people or wait till you have more oranges."
  	  puts "#{peopleOrPerson(@guests - @stock + 1)} went home without getting an orange."
  	  @stock = 0
  	else
  	  @stock -= @guests + 1
  	  puts "Awesome party! You have #{plural(@stock)} left in stock."
  	end
  end

  def eat
  	print "How many oranges are you going to eat?:"
  	@appetite = gets.chomp.to_i
  	if @appetite > @stock
      puts "Your appetite was bigger than the oranges in stock."
      @stock = 0
    else
      @stock -= @appetite
      puts "That really hit the spot. You have #{plural(@stock)} left in stock."
    end
  end

  def water
  	@water += 1
  end

  def countOranges
  	puts "There are #{plural(@oranges)} in the tree."
  end

  def countStock
  	puts "There are #{plural(@stock)} in stock."
  end

  def pickAnOrange
  	if @oranges < 1
  	  puts "There are no oranges to pick."
  	else
  	  @oranges -= 1
  	  puts "What a delicious orange."
  	  puts "There is still #{plural(@oranges)} left. You should harvest or pick them all."

  	end
  end

  def harvest
  	if @oranges < 1
  	  puts "There are no oranges to harvest."
  	else
  	  @stock += @oranges
  	  @oranges = 0
  	  puts "All oranges are harvested. You now have #{plural(@stock)} in stock"

  	end
  end

  private

  def peopleOrPerson(num)
  	if num == 1
  	  return num.to_s + " person"
  	else
  	  return num.to_s + " people"
  	end
  end

  def getInput
  	print "Command: "
  	@input = gets.chomp
  	puts ""
  end

  def help
    @commands.each do |command, description|
      puts command + description[1]
  	end
  end

  def q
   @exit = true
  end


  def doAction(action)

  	if @commands[action] == nil
  	  puts "I do not understand your command."
  	else
  	  eval @commands[action][0]
  	end

  end


  def plural(num)
  	if num == 1
  	  return num.to_s + " orange"
  	else
  	  return num.to_s + " oranges"
  	end
  end

end;nil
