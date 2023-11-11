private _drone = objNull;

while {true} do {

	private _drone_class = "CUP_O_Pchela1T_RU";
	private _generation = 1;
	private _height = 50 + (50 * _generation);

	// Sleep for a minute
	sleep 6;

	// 1. Is there a player in the AO?
	// Yes: Continue
	// No: waitUntil{} there is
	if (call SL_fnc_countPlayersInAO == 0) then {
	  continue;
	};

	// 2. Is there a UAV?
	// No: Spawn it and tell it to fuck off somewhere else
	if (isNull _drone or !alive _drone) then {
		// Create a unit in front of the runway and into the right direction
		_drone = _drone_class createVehicle getMarkerPos "droneSpawn";
		createVehicleCrew _drone;
		_drone engineOn true;
		_drone setDir 290;


		// Tell it fuck off into a holding parttern above the airfield
		_drone flyInHeight _height;
		[group _drone] call CBA_fnc_clearWaypoints;
		[group _drone, getMarkerPos "droneHold", 1, "MOVE", "AWARE", "YELLOW", "FULL" ] call CBA_fnc_addWaypoint;
	};

	// 3. Is the UAV flying?
	// Yes: Continue
	// No: destroy the UAV. Go to the start of the while loop, and start over.
	if (!isEngineOn _drone or !alive _drone) then {
	  deleteVehicle _drone;
	  _generation = _generation + 1;
	  continue;
	};
	// This time it will fly higher.

	// 4. Send the UAV to the red arrow
	_drone flyInHeight _height;
	[group _drone] call CBA_fnc_clearWaypoints;
	[group _drone, getPosATL red_arrow, 1, "MOVE", "AWARE", "YELLOW", "FULL" ] call CBA_fnc_addWaypoint;
	_drone setFuel 1;
};