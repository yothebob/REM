/// @description Variables
//The surface
surface = surface_create(1920,1080);
buffer = buffer_create(1920*1080*4,buffer_grow,1);

//Mouse/drawing position
mx = mouse_x 
my = mouse_y
mxp = mouse_x 
myp = mouse_y

//Other variables
colour = c_black;
width = 3;

//For color picker tool
picked_color = noone;
blue = 0;
green = 0;
red = 0;

index = 0;
b_array = [];

//An enum and global variable to manage what tool is selected
enum tool {
	pen,
	eraser,
	colorpicker,
	text,
	rectangle,
	circle,
	line,
	cable,
	hand

}

global.tool = tool.line;


