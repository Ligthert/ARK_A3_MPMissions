//params ["_veh","_pos","_amount"];

_veh = _this select 0;
_pos = _this select 1;
_amount = _this select 2;

["arty", format[ "Firing %1 round(s) from %2 towards %3" ,_amount, _pos, _veh] ] call SL_fnc_log;

// Add some spacing
//sleep random 4;

// Shoot stuff
gunner _veh doArtilleryFire [getPos _pos, currentMagazine _veh, _amount ];
// The mission maker should verify that the target is in rage.

// Maybe it replenishes ammo...
_veh setVehicleAmmoDef 1;
_veh setVehicleAmmo 1;
// Usually doesn't
