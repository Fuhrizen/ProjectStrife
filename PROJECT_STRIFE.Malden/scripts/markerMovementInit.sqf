params["_unitHandler"]; 

[_unitHandler] spawn {   

 a=true;  //Debug force close loop  
 _marker=(_this select 0) getVariable "unitMarker";      
 
 _speed=(_this select 0) getVariable "speed";    
 
 while {a} do { _queue = (_this select 0) getVariable["unitDestinationQueue",[]];    
 
 _targetX = _queue select 0;           
 _targetY = _queue select 1;          
 _currentX = [getMarkerPos _marker] select 0;            
 _currentX = _currentX select 0;          
 _currentY = [getMarkerPos _marker] select 0;            
 _currentY = _currenty select 1;           
 _tX = ( _targetX - _currentX );          
 _tY = ( _targetY -_currentY );  
 
 _dist = sqrt (_tX*_tx+_ty*_ty);  
 
 if (_dist >= 1) then {      
 
  _velX = (_tX/_dist)*((_this select 0) getVariable ["speed",1]);         
  _velY = (_tY/_dist)*((_this select 0) getVariable ["speed",1]);          
  _marker setMarkerPos [_currentX+_velX,_currentY+_velY];     
  uisleep (0.1/timescale); 
  
  };   
  
 if (_dist <=1.5 && count _queue >1) then { 
 
  _queue deleteAt 0;   
  (_this select 0) setVariable["unitDestinationQueue",_queue];   
  hint str(_queue);   
  
 };   
 
 };    
 
};