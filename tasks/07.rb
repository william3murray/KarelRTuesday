
$graphical = true

require_relative "will_robot"
require_relative "../karel/robota"
 
class Strategie
  def courir(robot)
    raise NotImplementedError.new(“Strategie pas implémenté”)
  end
end   

class OneBlocStrategie < Strategie
  def courir(robot)
    3.times do 
      robot.put_beeper
      robot.move
    end
  end
end 

class TwoBlocStrategie < Strategie
  def courir(robot)
    3.times do 
      robot.put_beeper
      robot.put_beeper
      robot.move
    end
  end
end     

class ThreeBlocStrategie < Strategie
  def courir(robot)
    3.times do 
      robot.put_beeper
      robot.put_beeper
      robot.put_beeper
      robot.move
    end
  end
end     



class RunnerRobot < UrRobot
  @runner_strategy = nil
  def initialize(street,avenue, direction, beepers)
    super(street,avenue, direction, beepers)
    @runner_strategy = OneBlocStrategie.new()
  end
  def set_strategy(strategy)
    @runner_strategy = strategy
  end
  def courir
    @runner_strategy.courir(self)
  end
end

def task()
  world = Robota::World
  # world.read_world("../worlds/map.05a")
  
  runner = RunnerRobot.new(1,1,NORTH,INFINITY)
  runner.set_strategy(OneBlocStrategie.new)
  runner2 = RunnerRobot.new(1,3,NORTH,INFINITY)
  runner2.set_strategy(TwoBlocStrategie.new)
  runner3 = RunnerRobot.new(1,5,NORTH,INFINITY)
  runner3.set_strategy(ThreeBlocStrategie.new)

  runner.courir
  runner2.courir
  runner3.courir
  
end








if __FILE__ == $0
  if $graphical
     screen = window(10, 40) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end