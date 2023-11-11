params ["_start","_end","_altitude","_width"];

drawdot = {
	params ["_pos"];

	mymarker = createMarker ["dot"+(str _pos), _pos];
	mymarker setMarkerShape "ICON";
	mymarker setMarkerColor "ColorRed";
	mymarker setMarkerType "hd_dot_noShadow";
};

//diag_log format ["Width: %1", _width];
//diag_log format ["Start: %1; End: %2;", (getPos _start),(getPos _end)];

private _direction = _start getRelDir _end;
private _path = [];
private _step = [];
private _block = [];

while {_width != 0} do {

	// I need the pos, because otherwise the script would be moving around objects.
	_orig_start	= getpos _start;
	_row_start 	= _start;
	_row_end 	= _end;

	while { _row_start distance _row_end >= 1 } do {

	  _step = _row_start getPos [1,_direction];

	  [_step] call drawdot;

	  _row_start setpos _step;

	  _block = [ _step select 0 , _step select 1 , (getPosASL _row_start select 2) - _altitude];

	  _path pushBack _block;

	};

	_start setPos _orig_start;
	//diag_log format ["Start: %1", getPos _start];
	_start 	setPos ( _start	getPos [1, _direction - 90 ] );
	//diag_log format ["Start: %1", getPos _start];
	_end 	setPos ( _end 	getPos [1, _direction - 90 ] );

	_width = _width - 1;

	//diag_log format ["Width: %1", _width];
	//diag_log format ["Start: %1; End: %2;", getPos _start,getPos _end];
	//diag_log format ["Count: %1;",count _path];

};



setTerrainHeight [_path,true];
