
//Create a unit

createUnit = compile preprocessFile "scripts\createUnit.sqf";
[_position,_speed,_side] call createUnit;


selectedUnit is currently being used to find out what unit is selected for a player. (Is GLOBAL therefore is temporary)