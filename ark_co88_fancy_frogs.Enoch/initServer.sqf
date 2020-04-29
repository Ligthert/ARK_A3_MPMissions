// Place all the BLUFOR units on top of the carrier.
{
  if (side _x == west) then {
    _x setPosASL [getPos _x select 0, getPos _x select 1, 1516];
  }
} forEach allUnits;
