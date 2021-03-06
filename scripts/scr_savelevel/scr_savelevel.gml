///scr_savelevel()
function scr_savelevel() {
	ini_open("File"+string(global.file)+".ini");

	if global.level_clear_rate="clear"and ini_read_string("Level"+string(global.current_level),"clear_rate",false)!="clear"
	{if global.current_level>0{ini_write_real("Player","number_of_levels_cleared",ini_read_real("Player","number_of_levels_cleared",false)+1);}
	ini_write_string("Level"+string(global.current_level),"clear_rate","clear");}

	if global.level_clear_rate="clear"{ini_write_real("Level"+string(global.current_level),"number_of_clears",ini_read_real("Player","number_of_clears",false)+1);}

	if global.big_collectible_number1=true{ini_write_real("Level"+string(global.current_level),"big_collectible_number1",true);}
	if global.big_collectible_number2=true{ini_write_real("Level"+string(global.current_level),"big_collectible_number2",true);}
	if global.big_collectible_number3=true{ini_write_real("Level"+string(global.current_level),"big_collectible_number3",true);}
	if global.big_collectible_number4=true{ini_write_real("Level"+string(global.current_level),"big_collectible_number4",true);}
	if global.big_collectible_number5=true{ini_write_real("Level"+string(global.current_level),"big_collectible_number5",true);}
	ini_write_real("Level"+string(global.current_level),"lives_until_assist",global.lives_until_assist);
	ini_write_real("Level"+string(global.current_level),"x_checkpoint",global.x_checkpoint);
	ini_write_real("Level"+string(global.current_level),"y_checkpoint",global.y_checkpoint);
	ini_write_real("Level"+string(global.current_level),"checkpoint_millisecond",global.checkpoint_millisecond);
	ini_write_real("Level"+string(global.current_level),"checkpoint_second",global.checkpoint_second);
	ini_write_real("Level"+string(global.current_level),"checkpoint_minute",global.checkpoint_minute);
	ini_write_real("Level"+string(global.current_level),"checkpoint_realmillisecond",global.checkpoint_realmillisecond);
	if global.timeattack_realmillisecond>2

	//Save Fastest Time
	if!ini_key_exists("Level"+string(global.current_level),"timeattack_realmillisecond")
	or global.timeattack_realmillisecond<ini_read_real("Level"+string(global.current_level),"timeattack_realmillisecond",global.timeattack_realmillisecond)
	{ini_write_real("Level"+string(global.current_level),"timeattack_millisecond",global.timeattack_millisecond);
	ini_write_real("Level"+string(global.current_level),"timeattack_second",global.timeattack_second);
	ini_write_real("Level"+string(global.current_level),"timeattack_minute",global.timeattack_minute);
	ini_write_real("Level"+string(global.current_level),"timeattack_realmillisecond",global.timeattack_realmillisecond);}//Save Fastest Time End

	if score>ini_read_real("Level"+string(global.current_level),"level_score",false){ini_write_real("Level"+string(global.current_level),"level_score",score);}
	ini_close();
	//Level Save End


}
