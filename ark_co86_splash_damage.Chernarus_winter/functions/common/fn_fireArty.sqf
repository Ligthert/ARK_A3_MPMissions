params ["_veh","_pos","_amount"];

// _veh = _this select 0;
// _pos = _this select 1;
// _amount = _this select 2;

if (( (getPos _pos) inRangeOfArtillery [[gunner _veh], currentMagazine _veh]) isEqualTo false) exitWith {
	["arty", format[ "%3 => %2 is out of range. Exiting." ,_amount, _pos, _veh] ] call SL_fnc_log;    
};

["arty", format[ "Firing %1 round(s) from %3 towards %2" ,_amount, _pos, _veh] ] call SL_fnc_log;

// Shoot stuff
gunner _veh doArtilleryFire [getPos _pos, currentMagazine _veh, _amount ];
// The mission maker should verify that the target is in rage.

// Maybe it replenishes ammo...
_veh setVehicleAmmoDef 1;
_veh setVehicleAmmo 1;
// Usually doesn't
