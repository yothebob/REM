
function draw_part_total(_value, xoffset,yoffset,_string) 
{
if (_value >0)
{
draw_text_color(xoffset,yoffset,_string + string(_value),c_green, c_green, c_green, c_green, 1);
}
else
{
draw_text_color(xoffset,yoffset,_string + string(_value),c_dkgray,c_dkgray,c_dkgray,c_dkgray,1);
}
}