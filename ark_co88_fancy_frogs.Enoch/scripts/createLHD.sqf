// Execute script only on the server, or else Dancemoox gets mad at me.
if (!isServer)  exitwith {};

// Set an altitude at above sea-level
_altitude = 1500;

// Get the position of the object with the name in the parameter and create a position 2km above sealevel
_LHDspawnpoint = [getPosASL _this select 0, getPosASL _this select 1, _altitude];

// Take that position (*ssssh* its actually an array with 3 elements) and spawn the heli-carrier!
{
  // Spawn the object in the list below.
  _dummy = createVehicle [_x, _LHDspawnpoint, [], 0, "NONE"];

  // Give the thing some direction.
  _dummy setdir 270;

  // place the buildingblock
  _dummy setPos _LHDspawnpoint;

  // Set it straight up in order to avoid the terrain.
  _dummy setVectorUp [0,0,1];

  // Straighten out the object
  //_dummy setPosASL [getPos _dummy select 0, getPos _dummy select 1, 350];

} foreach ["Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"];
