// Assuming this runs in scheduled space.

// Variables
private "_veh";
private "_radius";
private "_roads";
private "_waypoints";

_veh = _this select 0;
_radius = 0;
_roads = [];

// Functions
private "_randomRoadPos";
_randomRoadPos = {
  _pos = _this select 0;
  // Search in increments of 100meters, give up after a kilometer.
  while {count _roads == 0} do {
    _radius = _radius + 100;
    _roads = _pos nearRoads _radius;
  };
  getPos (selectRandom _roads)
};

// Since we can assume that there are always roads in Livonia there is no need to filter ofr that.. So just put it on a random road.
_veh setPos ([getPos _veh] call _randomRoadPos);

/* Freezes the game for some magical reason.. Commenting out.

// TODO: Manage waypoints since they still point to random locations in the forests...
sleep 10;

// Do this while the vehicle is still alive, otherwise its exit script:
while {alive _veh} do {

  // Wait until it has a driver again. AI can do weird stuff.
  waitUntil {driver _veh};

  // Iterate through the waypoints and set the completion radius to something that is on a road.
  {
    private "_counter";
    _counter = 0;
    [group (driver _veh),_counter] setWaypointCompletionRadius 250;
  } forEach (waypoints (group (driver _veh)));

  // Sleep a minute.. Rinse and repeat.
  sleep 60;
};
*/
