params ["_veh","_pos","_amount"];

gunner _veh doArtilleryFire [getPos _pos, currentMagazine _veh, _amount ];
_veh setVehicleAmmoDef 1;
_veh setVehicleAmmo 1;