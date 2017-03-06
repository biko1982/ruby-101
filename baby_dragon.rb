class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.
    @commands = { "help"    => ["help",          "    : Shows this list"],
  	              "q"       => ["q",             "       : Quit"],
  	              "feed"    => ["feed",          "    : Feed your baby dragon."],
  	              "walk"    => ["walk",          "    : Take a walk with your baby dragon."],
  	              "sleep"   => ["putToBed",      "   : Put your baby dragon to bed."],
  	              "rock"    => ["rock",          "    : Rock your baby dragin to sleep."],
  	              "toss"    => ["toss",          "    : Toss the baby dragon in the air."]}

    puts @name + ' the dragon is born.'
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


  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private

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

  def hungry?
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      # Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  # This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end

end;nil
