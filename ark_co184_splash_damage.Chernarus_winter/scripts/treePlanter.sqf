// Populate with trees

["trees",_this select 0] call SL_fnc_log;

// Parameters:
//	- Position
//	- Radius (m)
//	- Number of trees to place
//	- Quit the script after x consecutive failure (read: everything is saturated)
params ["_pos","_radius","_number","_giveup"];

// Trees that should be on the side of th road
private _trees_roadside = ["CUP_t_picea2sW","CUP_t_picea1sW","CUP_t_pinuxN1sW"];

// Trees anywhere else
private _trees_forest = ["CUP_t_picea3fWW","CUP_t_pinusN2sW"];
private _trees = ["\cup\terrains\cup_terrains_winter_plants\Trees\cup_t_picea3fW.p3d","\cup\terrains\cup_terrains_winter_plants\Trees\cup_t_pinusN2sW.p3d"];

// Circuit breaker
private _objects = 0; // Objects placed
private _counter = 0; // placement failure counter
private _saturated = false; // Once _counter hits _giveup, set this to true

// Logic
private _blocked = false;

// Enter the spammy loop
while {_saturated == false} do {
  
  	// Reset
	_blocked = false;

	// Get a random pos `origin getPos [distance, heading]`
	_rndPos = _pos getPos [random _radius, random 360];

	// Check if there is a road nearby
	// true: _blocked is true
	//diag_log format ["%1 nearRoads 15: %2", _rndPos, (_rndPos nearRoads 15)];
	if (count (_rndPos nearRoads 25) !=0 ) then {
	  _blocked = true;
	};

	// Check if there are objects nearby
	// true: _blocked is true
	if (count (_rndPos nearObjects 5) !=0 ) then {
	  _blocked = true;
	};

	// Check if there are terrain objects nearby
	// true: _blocked is true
	if ( count (nearestTerrainObjects [_rndPos, ["Tree", "Bush", "HIDE"], 5, false, true]) !=0 ) then {
	  _blocked = true;
	};

	// In case of failure
	if (_blocked == true) then { 
		_counter = _counter + 1;
	};

	// In case we failed too hard
	if (_counter == _giveup) then { 
		_saturated = true;
	};

	// In case of win!
	if (_blocked == false) then {
		["trees",format ["Placing: %1 (# %2)",_rndPos,_objects] ] call SL_fnc_log;
		_obj = (selectRandom _trees_forest) createVehicle _rndPos;
		//_obj = createSimpleObject [selectRandom _trees, AGLToASL _rndPos];
		_obj setDir (random 360);
		_objects = _objects + 1;
		_counter = 0;
	};

	// In case of harder win!
	if (_number == _objects) then {
	  _saturated = true;
	};
	// If near a road place the object to the side of the road
	// else just place it where it is
	// Don't forget to orient it to sea-level

};

["trees",format ["Finished planting trees."] ] call SL_fnc_log;
["trees",format ["Planted: %1", _objects] ] call SL_fnc_log;