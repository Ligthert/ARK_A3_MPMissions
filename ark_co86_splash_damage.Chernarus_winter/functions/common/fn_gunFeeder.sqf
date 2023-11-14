// Gun Feeder
// In case the gunner of _gun dies, feed a unit from the _grp as a replacement.

// _grp = [bunker8] call SL_fnc_buildingFiller;
// [gun_hill, _grp] call SL_fnc_gunFeeder;

params ["_gun", "_grp"];

[ format ["gunFeeder:%1",_gun], format ["Starting, using group %1.",_grp] ] call SL_fnc_log;

[_gun,_grp] spawn {

	while { count (units _grp) >= 1} do {
		waitUntil { count (crew _gun) == 0 };
		_unit = selectRandom (units _grp);
		_unit assignAsGunner _gun;
		[_unit] orderGetIn true;
		[ format ["gunFeeder:%1",_gun], format ["Gunner died, replacing with %1.",_unit] ] call SL_fnc_log;
		waitUntil { count (crew _gun) == 1 };
	};

};
