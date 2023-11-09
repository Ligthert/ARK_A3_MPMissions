// Populate with trees

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

// Circuit breaker
private _objects = 0; // Objects placed
private _counter = 0; // placement failure counter
private _saturated = false; // Once _counter hits _giveup, set this to true

// Logic
private _blocked = false;

// Enter the spammy loop
while {_saturated == false} do {
  
  	// Reset
	private _blocked = false;

	// Get a random pos `origin getPos [distance, heading]`

	// Check if there is a road nearby
	// true: _blocked is true

	// Check if there are objects nearby
	// true: _blocked is true

	// Check if there are terrain objects nearby
	// true: _blocked is true

	// if (_blocked == true) then { _counter = _counter + 1;  };
	// if (_counter == _giveup) then {_saturated = true;}

	// if (blocked == false) then {}
	// If near a road place the object to the side of the road
	// else just place it where it is
	// Don't forget to orient it to sea-level

};



// nearestTerrainObjects [player, ["Tree", "Bush", "HIDE"], 5, false, true];
// player nearRoads 15
// player nearObjects 10