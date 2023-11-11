params ["_pos", "_radius", "_height"];

private _area = [];
private _xmin = round( (_pos select 0) - _radius);
private _xmax = round( (_pos select 0) + _radius);
private _ymin = round( (_pos select 1) - _radius);
private _ymax = round( (_pos select 1) + _radius);

for "_xaxis" from _xmin to _xmax do
{
	for "_yaxis" from _ymin to _ymax do
	{
		_area pushBack [_xaxis,_yaxis, _height];
	};
};

//hint str _area;

setTerrainHeight [_area,true];