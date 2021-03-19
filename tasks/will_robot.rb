require_relative "../karel/ur_robot"
require_relative "../mixins/will_module"
require_relative "../mixins/move_module"
require_relative "../mixins/sensor_pack" 

class WillRobot < UrRobot
	include WillModule
  include SensorPack
  include MoveModule
	
  def turn_right
		turn_left
		turn_left
		turn_left
	end

	def turn_around
		turn_left
		turn_left
	end

	def back_up 
		turn_around
		move
		turn_around
	end

	# climb one stair
  def climb_stair
    turn_left
    move
    turn_right
    move
  end
  # sweep beepers from three stairs: one beeper per step
  def sweep_stairs
    climb_stair
    pick_beeper
    climb_stair
    pick_beeper
    climb_stair
    pick_beeper
    turn_off
  end
  
  # The standard task for this class of robots
 def run_task
    sweep_stairs
  end

  def collect_row1
  	move
  	pick_beeper
  	move
  	pick_beeper
  	move
  	pick_beeper
  	move
  	pick_beeper
  	move
  	pick_beeper
  	move
  	turn_left
  	move
  	turn_left
  end

  def collect_row2
  	move
  	pick_beeper
  	move
  	pick_beeper
  	move 
  	pick_beeper
  	move
  	pick_beeper
  	move
  	pick_beeper
  	move
  	turn_right
  	move
  	turn_right
  end

  def collect_all
  	collect_row1
  	collect_row2
  	collect_row1
  	collect_row2
  	collect_row1
  	collect_row2
  	turn_right
  	move
  	turn_right
  end

  def bowling_pins
  	move
  	put_beeper
  	move
  	turn_left
  	move
  	put_beeper
  	move
  	turn_right
  	move
  	put_beeper
  	turn_left
  	move
  	turn_right
  	move 
  	put_beeper
  	turn_right
  	move
  	move
  	put_beeper
  	move
  	move
  	put_beeper
  	move
  	move
  	put_beeper
  	turn_around
  	move
  	turn_left
  	move
  	put_beeper
  	move
  	turn_right
  	move
  	put_beeper
  	move
  	turn_right
  	move
  	put_beeper
  	move
  	move
  	turn_around
  end

  def grab_diagonal_row_up
  	move
  	pick_beeper
  	move
  	turn_left
  	move
  	pick_beeper
  	move
  	turn_right
  	move
  	pick_beeper
  	move
  	turn_left
  	move
  	pick_beeper
  	turn_right
  	move
  	move
  	turn_right
  	move
  	turn_right
  end

  def grab_diagonal_row_down
  	move
  	pick_beeper
  	move
  	turn_left
  	move
  	pick_beeper
  	move
  	turn_right
  	move
  	pick_beeper
  	move
  	turn_left
  	move
  	pick_beeper
  	move
  	turn_left
  end

  def grab_square_beepers
  	grab_diagonal_row_up
  	grab_diagonal_row_down
  	grab_diagonal_row_up
  	grab_diagonal_row_down
  end

  def place_beeper_row
  	move
  	put_beeper
  	move
  	put_beeper
  	move
  	put_beeper
  	move
  	put_beeper
  	move
  	put_beeper
  	move
  	put_beeper
  	move
  	put_beeper
  	
  end

  def fill_box
  	place_beeper_row
  	turn_left
  	place_beeper_row
  	turn_left
  	place_beeper_row
  	turn_left
  	place_beeper_row
  end

  def collect_row
    move
    pick_beeper
    move
    pick_beeper
    move
    pick_beeper
    move
    pick_beeper
    move
    pick_beeper
    move
  end

  def place_row
    move 
    put_beeper
    move
    put_beeper
    move
    put_beeper
    move
    put_beeper
    move
    put_beeper
    move
  end

  def rearrange_line
    collect_row
    turn_right
    move
    move
    move
    turn_right
    move
    move
    move
    turn_right
    place_row
  end

  def question_1
    turn_left
    move
    move
    move
    turn_right
    move
    move
    turn_right
    rearrange_line
    turn_right
    move
    move
    turn_right
    move
    move
    move
    turn_right
  end
  
 def crawl
    80.times do 
      unless front_is_clear?
        if facing_west
          turn_right
          move
          turn_right
        else
          if facing_east
            turn_left
            move
            turn_left
          end
        end
        move
        if next_to_a_beeper?
          pick_beeper
        end
      end
    end
  end




end 