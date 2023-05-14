var ident = async_load[? "id" ];
var status = async_load[? "status"];
var error = async_load[? "error"];

/* Saving */
if (ident == global.saveid)
{ 
	buffer_delete(global.savebuff);
	show_debug_message("saved data status " + string(status) + " error " + string(error));
}
else if (ident == global.loadid)
{
	var buffstring = buffer_read(global.loadbuff,buffer_string);
	ini_open_from_string(buffstring);
	
	/*
		All your usual ini_read_real() or ini_read_string() stuff, as you have it just now.
		...
	*/
	
	ini_close();
	buffer_delete(global.loadbuff);
	show_debug_message("read string from buffer " + buffstring);
}