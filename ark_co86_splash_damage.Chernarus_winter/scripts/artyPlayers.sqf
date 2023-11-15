// Haras the players with arty that shouldn't hit them.

// If you aren't the server then go away...
if (!isServer) exitWith {};

// The real script
private ["_marker","_class","_ao"];

// [red_arrow, "CUP_O_Pchela1T_RU", "ao"] call "scripts\artyPlayers.sqf";

// There are three conditions that need to be met before this script can fire:
// 0) There are players in the _ao (this is covered by the fact the trigger that governs this fired)
// 1) There is a vehicle of _class in the _ao
// 2) This vehicle is near playars
// (For flavour, use `surfaceType` to check if the units are in forests or not)
// 
// Once these conditions are met, this script must:
// - Find the players nearst to the vehicle
// - Select a random position
// - Make sure it isn't near (>100m) other players
// - Tell the mortar team to fire at them
//
// Maybe at areas to avoid like friendly bases, not doing this would imply the enemy is dumb...
// ...which is funny.

// Check if the vehicle is in the AO
// (No need to check by class, just one UAV now)
if ( !((getPos (allUnitsUAV select 0)) inArea "ao") ) then {
  exitWith {};
};


// Check for the nearest player
private _closest;
private _distance =  90000;
private _tmp_distance;
{ 
	if ( ((getPos (allUnitsUAV select 0)) distance _x) < _distance ) then {
	  _closest = _x;
	};
	
} forEach allPlayers


// Enter loop in which we search for a nice place to spam the player with some mortars
//private _fired;
// 
// [{condition}, {code}, [params]] call CBA_fnc_waitUntilAndExecute;
// https://github.com/CBATeam/CBA_A3/blob/master/addons/common/fnc_waitUntilAndExecute.sqf