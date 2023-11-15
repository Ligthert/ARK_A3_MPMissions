// Gun Feeder
// In case the gunner of _gun dies, feed a unit from the _grp as a replacement.

// myGroup = [bunker8] call SL_fnc_buildingFiller;
// [gun_hill, myGroup] execVM "scripts\gunFeeder.sqf";

params ["_gun", "_grp"];

[ format ["gunFeeder:%1",_gun], format ["Starting, using group %1.",_grp] ] call SL_fnc_log;

private ["_done"];

_done = true;

while {_done} do {
	// Wait until the gunner is dead
	waitUntil { count (crew _gun) == 0 };

	// If the group is empty, exit script
	if (count units _grp == 0) exitWith {
		[ format ["gunFeeder:%1",_gun], "Gunner died. Out of units. Quitting." ] call SL_fnc_log;
		_done = false;
	};

	// Instruct the individual to start manning the gun.
	_unit = selectRandom (units _grp);
	_unit enableAI "PATH";
	_unit assignAsGunner _gun;
	[_unit] orderGetIn true;
	[ format ["gunFeeder:%1",_gun], format ["Gunner died, replacing it with %1.",_unit] ] call SL_fnc_log;
	waitUntil { count (crew _gun) == 1 };
};

// while { count (units _grp) >= 1} do {
// 	waitUntil { count (crew _gun) == 0 };
// 	_unit = selectRandom (units _grp);
// 	_unit assignAsGunner _gun;
// 	[_unit] orderGetIn true;
// 	[ format ["gunFeeder:%1",_gun], format ["Gunner died, replacing with %1.",_unit] ] call SL_fnc_log;
// 	waitUntil { count (crew _gun) == 1 };
// };
