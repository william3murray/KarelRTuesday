#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "will_robot"
require_relative "../karel/robota"
 
 class MonRobot < UrRobot
  def def initialize (street, avenue, direction, beepers)
    super(street, avenue, NORTH, beepers)
  end
end



def task()
  world = Robota::World
  world.read_world("../worlds/map.05a")
  
  karel = MonRobot.new(4, 3, Robota::EAST, 28)
  karel.
  
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