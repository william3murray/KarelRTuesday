module WillModule


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

  def move_2
  	move
  	move
  end
end
