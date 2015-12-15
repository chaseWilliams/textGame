#script that manages all monster things


class Monsters #kind of redundant right now, will add on
  @health
  @attack
  @name
  @isDead
  @monsterHitMessage
  
  def update
    @isDead = (@health <= 0)
    puts "#{@name} health at: #{@health}"
  end
  
  def phyAttack
    $playerHealth -= 5
  end
  
  def hitMessage
    return @monsterHitMessage + "#{$playerHealth}"
  end
  
  def health?
    return @health
  end
  
  def monsterDead?
    return @isDead
  end
  
  def hit(value)
    @health = @health - value
  end
end

class Zombie < Monsters
  def initialize
    @health = 20
    @attack = 2
    @monsterHitMessage = "You got bitten! Health now at "
    @name = 'Zombie'
    @isDead = false
  end
end
