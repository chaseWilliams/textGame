#master script; the one that is executed.

require './Monsters.rb'

$playerHealth
$playerAttack
$playerLevel
$playerDefense
$playerName
$playerItems

class Controller
  @input

  def initialize #start game sequence
    $playerHealth = 200
    $playerAttack = 10
    $playerLevel = 1
    $playerDefense = 0
    $playerItems = {}
    puts "Hello, welcome to RPG Legends, by Chase Williams"
    puts "Please enter a name"
    $playerName = gets.chomp
    puts 'Let\'s do a practice fight, #{$playerName}\nPlease enter F for fight, or I to look at Items.'
    self.fight
    puts "Congrats! \nE n d  o f  S e q u e n c e"
  end

  def fight #needs to be developed so that it can instantiate and initiate fight
    #with any monster, depending on parameter given. Right now only does 1 zombie
    m = Zombie.new
    while (!m.getZombieDead)
      puts "Fight!\n"
      @input = gets.chomp
      while (@input != "F")
      puts "Please enter something acceptable"
      @input = gets.chomp
    end
      if (@input == "F")
        m.hit
      end
      if (m.health? > 0)
        m.bite   #=> frustrating, can't get the two files to work, sharing data up(down?)stream
      else
        puts "You beat it!"
      end
      m.update
    end
  end
end
s = Controller.new
