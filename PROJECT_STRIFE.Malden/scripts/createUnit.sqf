params["_position","_speed","_side"]; 

[_position,_speed,_side] spawn {
	//Define Vars
	unitTracker =unitTracker+1; 
	_unitVariable = format["unit%1Handler",unitTracker];
	_unitName = format["Unit: %1",unitTracker];
	_markerVariable = format["unit%1Marker",unitTracker];	

	//Unit Entity Init
	missionNamespace setVariable [_unitVariable, "Land_Net_Fence_pole_F" createVehicle  (_this select 0)];
	_unitVariable = missionNamespace getVariable [_unitVariable,objNull];
	_unitVariable setVariable["unitName",_unitName,true];
	_unitVariable setVariable["unitMarker",_markerVariable,true];
	_unitVariable setVariable["unitSpeed",1,true];
	_unitVariable setVariable["unitDestinationQueue",[ (_this select 0),[0,0]],true];
	_unitVariable setVariable["faction",[ (_this select 2) ],true];
	
	
	//Unit Marker Init
	missionNamespace setVariable [_markerVariable,createMarker [_markerVariable, (_this select 0)]];
	_markerVariable = missionNamespace getVariable [_markerVariable,objNull];
	_markerVariable setMarkerType "mil_flag";
	if( (_this select 2)  == "BLUFOR") then {_markerVariable setMarkerColor "colorBLUFOR"}
	else { if ( (_this select 2)  == "OPFOR") then {_markerVariable setMarkerColor "colorOPFOR"}
	else { if ( (_this select 2)  == "IND") then {_markerVariable setMarkerColor "colorIndependent"};
	};
	};
	_markerVariable setMarkerText _unitName;
	
	//Attach object to marker
	[_unitVariable] spawn {
		_unit = (_this select 0);
		while({alive _unit}) do {
		 _unit setPos (getMarkerPos (_unit getVariable["unitMarker",""]));
		};
	};
	
	
	//Init Movement
	
	
};
