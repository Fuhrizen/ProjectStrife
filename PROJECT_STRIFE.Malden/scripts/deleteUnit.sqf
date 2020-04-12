params["_unitHandler"]; 

[_unitHandler] spawn {
	deleteVehicle (_this select 0);
	deleteMarker ((_this select 0) getVariable ["unitMarker",""]);
};
