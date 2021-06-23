/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 26F258D6
/// @DnDArgument : "code" "sliders.dist = distance_to_point(0,y);$(13_10)if global.colorslider = true$(13_10){$(13_10)y = yopen;$(13_10)$(13_10)}$(13_10)else$(13_10){$(13_10)y = yclose;$(13_10)}"
sliders.dist = distance_to_point(0,y);
if global.colorslider = true
{
y = yopen;

}
else
{
y = yclose;
}