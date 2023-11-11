private _units = [];
private _marker = "ao";

{
	if (position _x inArea _marker and alive _x) then {
	  _units pushBack _x;
	};

} forEach call BIS_fnc_listPlayers;

count _units;
