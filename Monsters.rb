#script that manages all monster things


class Monsters #kind of redundant right now, will add on
  @health
  @attack
end

class Zombie < Monsters
  @zombieDead
  def initialize
    @health = 20
    @attack = 2
  end

  def update
    @zombieDead = (@health <= 0)
    puts "Zombie health at: #{@health}"
  end

  def bite
    $playerHealth = $playerHealth - 5
  end

  def hitMessage
    return "You got bitten! Health now at #{$playerHealth}"
  end

  def health?
    return @health
  end

  def getZombieDead
    return @zombieDead
  end

  def hit(value)
    @health = @health - value
  end
end
