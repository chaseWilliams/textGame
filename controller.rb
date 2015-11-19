require './Monsters.rb'
monster = Monsters.new
class Controller
  @@usrName
  @@playerH
  @@playerA
  @@input
  def initialize #start game sequence
    @@playerA = 10
    @@playerH = 200
    puts "Hello, welcome to RPG Legends, by Chase Williams"
    puts "Please enter a name"
    @@usrName = gets.chomp
    puts @@usrName
    puts "Let's do a practice fight, #{@@usrName}\nPlease enter F for fight, D for defend, and
    I for item."
    self.fight
    puts "Congrats! E n d  o f  S e q u e n c e"

  end

  def getHealth
    return @@playerA
  end

  def fight #needs to be developed so that it can instantiate and initiate fight
    #with any monster, depending on parameter given. Right now only does 1 zombie
    m = Zombie.new
    while (!m.getZombieDead)
      puts "Fight!\n"
      @@input = gets.chomp
      if (@@input == "F")
        m.hit
      end
      if (m.health? > 0)
        #m.bite   => frustrating, can't get the two files to work, sharing data up(down?)stream
      else
        puts "You beat it!"
      end
      m.update
    end
  end

end
s = Controller.new
