/// @description Insert description here
// You can write your code in this editor
if (debug_on) {
	

	draw_set_color(c_white)

	if instance_exists(Player) {
		draw_text(32, 0, "Dash Count: " + string(Player.dashCount))
		draw_text(32, 16, "HSPD: " + string(Player.hspd))
		draw_text(128, 16, "VSPD: " + string(round(Player.vspd)))
		if (Player.hspd > 0) && Player.vspd == 0 {
		//going right
		draw_text(224, 16, "Direction: right")
		} else if (Player.hspd < 0) && (Player.vspd == 0) {
		//going left
		draw_text(224, 16, "Direction: left")
		} else if (Player.hspd == 0) && (Player.vspd > 0) {
		//going down
		draw_text(224, 16, "Direction: down")
		} else if (Player.hspd == 0) && (Player.vspd < 0) {
		//going up
		draw_text(224, 16, "Direction: up")
		} else if (Player.hspd < 0) && (Player.vspd > 0) {
		//going down left
		draw_text(224, 16, "Direction: down-left")
		} else if (Player.hspd > 0) && Player.vspd > 0 {
		//going down right
		draw_text(224, 16, "Direction: down-right")
		} else if (Player.hspd < 0) && Player.vspd < 0 {
		//going up left
		draw_text(224, 16, "Direction: up-left")
		} else if (Player.hspd > 0) && Player.vspd < 0 {
		//going up right
		draw_text(224, 16, "Direction: up-right")
		} else if (Player.hspd == 0 && Player.vspd == 0){
		draw_text(224, 16, "Direction: idle")
		} else {
		draw_text(224, 16, "Direction: JUMP PEAK")
		}
		draw_text(416, 16, "State: " + string(script_get_name(Player.state)));
		draw_text(32, 48, "Debug Message: " + Player.debug_message);
		with Player {
			if Player.inAir {
				draw_text(32, 64, "IN AIR")
			} else {
				draw_text(32, 64, "ON GROUND")	
			}
		}
		
	}
}