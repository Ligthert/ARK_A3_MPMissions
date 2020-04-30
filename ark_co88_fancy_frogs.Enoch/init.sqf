// Spawn the carrier
lhd_center execVM "scripts\createLHD.sqf";

// Hide the markers that have "cleanup-" in its name.
{
  if ( [_x,"cleanup-"] call CBA_fnc_find != -1 ) then {
    _x setMarkerAlpha 0
  };
} forEach allMapMarkers;
