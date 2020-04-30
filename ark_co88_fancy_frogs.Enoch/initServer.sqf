// Place all the BLUFOR units on top of the carrier.
{
  if (side _x == west) then {
    _x setPosASL [getPos _x select 0, getPos _x select 1, 1516];
  }
} forEach allUnits;

// Have the triggers be less of a drain on the server by relaxing the detection time to 5 seconds.
{
  _x setTriggerInterval 5;
} forEach allMissionObjects "EmptyDetector";

// [""] call sl_fnc_cleanUpAi;
sl_fnc_cleanUpAi = {
  // MINE!
  private "_trigger";
  _trigger = _this select 0;

  {
      // If the unit is:
      // - Communist scum
      // - In the targeted trigger area
      // Send them to their buddy Trotsky (Along with their 3rd-rate vehicles)
      if ( side _x == east && (getPosASL _x) inArea _trigger ) then {
        deleteVehicle (vehicle _x);
        deleteVehicle _x;
      };
  } forEach allUnits;
};
