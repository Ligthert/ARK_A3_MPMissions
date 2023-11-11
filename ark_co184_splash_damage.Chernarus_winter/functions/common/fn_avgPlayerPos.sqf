// Goal, find the center of all the active BLUFOR units in the AO and send a drone there to spy on them.

// Define the AO by specifying a marker
//private _marker = "ao";
params ["_marker"];

red_arrow = "Sign_Arrow_Large_F" createVehicle [0,0,0];

// The joy of an endless while loop, so run as long as the scenario is running
while {true} do {

	// Declare an array
	private _units = [];

	// Iterate through the players that are:
	// a) In the AO
	// b) and ALiVE
	{
		if (position _x inArea _marker and alive _x) then {
		  _units pushBack _x
		};

	} forEach call BIS_fnc_listPlayers;

	// If there is something in the AO, update the position
	if (count _units != 0) then {
	  private _xtot = 0;
	  private _ytot = 0;
	  
	  {
	    _xtot = _xtot + ( getPos _x select 0 );
	    _ytot = _ytot + ( getPos _x select 1 );
	  } forEach _units;

	  // TODO: use another object the UAV can fly to and encircle
	  red_arrow setPos [(_xtot/count _units),(_ytot/count _units)];
	};

	// Wait a minute
	sleep 6;
};
