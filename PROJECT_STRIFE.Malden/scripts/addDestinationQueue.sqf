
//DEPRECATED?

params["_handler","_destination"]; 

[_handler,_destination] spawn {
  
  
 _newQueue = (_this select 0) getVariable["unitDestinationQueue",[]];
_newDestination = (_this select 1);
_newDestination set [0,round(_newDestination select 0)];
_newDestination set [1,round(_newDestination select 1)];
_newQueue = _newQueue + [_newDestination];


(_this select 0) setVariable ["unitDestinationQueue",[_newqueue]]; 
hint str(_newqueue);
  
};