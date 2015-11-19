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
    @@playerH -= 5 #nOTE need new way of accessing player health variable. doesn't play niec
    #when set to require and access like i did from this file to controller.
  end

  def health?
    return @health
  end

  def getZombieDead
    return @zombieDead
  end


  def hit
    @health -= 10
  end
end
