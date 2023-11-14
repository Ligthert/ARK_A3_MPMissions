params ["_pos"];

mymarker = createMarker ["dot"+(str _pos), _pos];
mymarker setMarkerShape "ICON";
mymarker setMarkerColor "ColorRed";
mymarker setMarkerType "hd_dot_noShadow";
