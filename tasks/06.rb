$graphical = true

require_relative "will_robot"
require_relative "../karel/robota"
class Ecrivian < will_robot

 class EcrivianDeH < Ecrivian
  def ecrit_lettre
    5.times do
      move
      put_beeper
    end
    turn_right
    move3
    turn_right
    5.times do
      move
      put_beeper
    end
    turn_right
    move
    turn_right
    move2
    put_beeper
    turn_left
    move
    put_beeper
    turn_left
    move4

  end
end

class EcrivianDeE
  def ecrit_lettre
    5.times do
      move
      put_beeper
    end
    turn_right
    move
    put_beeper
    move
    put_beeper
    turn_right
    move2
    put_beeper
    turn_right
    move
    put_beeper
    turn_left
    move2
    put_beeper
    turn_left
    move
    put_beeper
    turn_right
    move4
  end
end



def task()
  world = Robota::World
  #world.read_world("../worlds/map.05a")
  
  karel = EcrivianDeH.new(2, 2, Robota::NORTH, 12)
  karel2 = EcrivianDeE.new(2, 7, Robota::NORTH, 11)
  karel3 = EcrivianDeL.new(2, 11, Robota::NORTH, 7)
  karel4 = EcrivianDeL.new(2, 15, Robota::NORTH, 7)
  karel5 = EcrivianDeO.new(2, 19, Robota::NORTH, 12)
  karel.ecrit_lettre
  kare2.ecrit_lettre
  kare3.ecrit_lettre
  kare4.ecrit_lettre
  kare5.ecrit_lettre
end

if __FILE__ == $0
  if $graphical
     screen = window(22, 90) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end