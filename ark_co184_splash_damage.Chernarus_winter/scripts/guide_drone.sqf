// Guide the UAV to haras the players
drone flyInHeight 100;
[group drone] call CBA_fnc_clearWaypoints;
[group drone, getPosATL red_arrow, 1, "MOVE", "AWARE", "YELLOW", "FULL" ] call CBA_fnc_addWaypoint;
// drone flyInHeight 100;
// [drone, 100, position drone, "ATL"] call BIS_fnc_setHeight;