$graphical = true
require_relative "../karel/ur_robot"
require_relative "../mixins/will_module"
require_relative "../mixins/sensor_pack" 

class MineSweeper < UrRobot
  include WillModule
  include SensorPack

  
  def crawl
    80.times do 
      unless front_is_clear?
        if facing_west?
          turn_right
          move
          turn_right
        else
          if facing_east?
            turn_left
            move
            turn_left
          end
        end
       else 
        move
      end
      if next_to_a_beeper?
        pick_beeper
      end
    end
  end
end




def task()
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")
  
  karel = MineSweeper.new(2, 10, Robota::WEST, 28)
  karel.crawl
end

if __FILE__ == $0
  if $graphical
     screen = window(12, 50) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end