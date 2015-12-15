#master script; the one that is executed.

require './Monsters.rb'

class Controller
  @input
  @itemCount

  def initialize #start game sequence
    $playerMaxHealth = 200
    $playerHealth = 150
    $playerAttack = 10
    $playerLevel = 1
    $playerDefense = 0
    $playerItems = {
      #arguments are quantity, value
      potion: [1, 50]
    }
    @itemCount = "#{$playerItems[:potion][0]} potions"
    puts "Hello, welcome to RPG Legends, by Chase Williams"
    puts "Please enter a name"
    $playerName = gets.chomp
    puts "Lets do a practice fight, #{$playerName}\nPlease enter F for fight, or I to look at Items."
    self.fight('Zombie')
    puts "Congrats! Finished with #{$playerHealth} out of #{$playerMaxHealth}\nE n d  o f  S e q u e n c e"
  end

  def fight(monsterToFight) #needs to be developed so that it can instantiate and initiate fight
    #with any monster, depending on parameter given. Right now only does 1 zombie
    case monsterToFight
    when "Zombie"
      m = Zombie.new
    when "Vampire"
      puts "not ready yet"
      return nil
    else
      puts "error 503"
      return nil
    end
    
    puts "#{$playerName}, your health is at #{$playerHealth} / #{$playerMaxHealth}"
    while (!m.monsterDead?)
      puts "Fight!\n"
      @input = gets.chomp
      while (@input != "F" && @input != "I")
      puts "Please enter something acceptable"
      @input = gets.chomp
    end
    turn_over = false
    replay = false
    while turn_over == false
      if replay then @input = gets.chomp end    #checks to see if loop is running again, in that case
        #new input is needed
      if @input != 'F' && @input != 'I' then puts 'Invalid' end    #gatekeeper
      if (@input == "F")
        m.hit($playerAttack)
        turn_over = true
      elsif @input == 'I'
        puts "You have #{@itemCount}\nEnter 'Potion' to use. Otherwise, enter anything"
        @input = gets.chomp
        if @input == 'Potion'
          self.healPlayer($playerItems[:potion][1])
          turn_over = true
          $playerItems[:potion][0] -= 1
          self.itemUpdate
        else
          replay = true
        end
      end
    end
      if (m.health? > 0)
        m.phyAttack
        puts m.hitMessage
      else
        puts "You beat it!"
      end
      m.update
    end
  end
  
  #player methods
  def healPlayer(value)
    if value + $playerHealth <= $playerMaxHealth
      $playerHealth += value
    else
      $playerHealth = $playerMaxHealth
    end
  end
  
  def itemUpdate
    @itemCount = $playerItems[:potion][0]
  end
end

#instantiates controller object; starts game
s = Controller.new