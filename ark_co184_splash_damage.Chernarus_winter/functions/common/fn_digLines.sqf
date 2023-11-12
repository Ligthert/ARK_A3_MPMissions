["trench","Starting trench tool"] call SL_fnc_log;

params ["_pos","_dir","_dis","_width","_depth","_updown"];

// _pos 	: Needs to be an object
// _dir 	: direction (0,90,180,270)
// _dis 	: distance in meters 
// _width 	: How many rows 
// _depth	: How many meters up or down 
// _updown	: "UP" or "DOWN"

private _path = [];
private _step = [];
private _block = [];
private _newASL = 0;

while {_width != 0} do {

	["trench",format["Digging %4 from %1 in the direction of %2 degrees for %3 meter(s).",getpos _pos, _dir, _dis, _updown]] call SL_fnc_log;

	// I need the pos, because otherwise the script would be moving around objects.
	_orig_start	= getpos _pos;
	_row_start 	= _pos;
	_row_end 	= _row_start getPos [_dis,_dir];

	while { _row_start distance _row_end >= 1 } do {
	  _step = _row_start getPos [1,_dir];
	  //[_step] call SL_fnc_drawDot;
	  _row_start setpos _step;

	  if (_updown == "UP") then {
	    _newASL = (getPosASL _row_start select 2) + _depth;
	  } else {
	    _newASL = (getPosASL _row_start select 2) - _depth;
	  };

	  _block = [ _step select 0 , _step select 1 , _newASL];
	  _path pushBack _block;
	};

	_pos setPos _orig_start;
	_pos setPos ( _pos	getPos [1, _dir - 90 ] );

	_width = _width - 1;

};



setTerrainHeight [_path,true];

{
	createSimpleObject ["ClutterCutter_small_EP1", _x];
} forEach array;