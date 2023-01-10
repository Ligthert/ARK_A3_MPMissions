if ( side player == west ) then {
  obj1 addAction ["Sabotage Device",{[30,[],{"obj1" setMarkerColor "ColorRED";obj1 setDamage 1;},{true},"Sabotaging Device"] call ace_common_fnc_progressBar}, [], 1 , true, false,  "", "((_target distance _this) <2)"];
  obj2 addAction ["Sabotage Device",{[45,[],{"obj2" setMarkerColor "ColorRED";obj2 setDamage 1;},{true},"Sabotaging Device"] call ace_common_fnc_progressBar}, [], 1 , true, false,  "", "((_target distance _this) <2)"];
  obj3 addAction ["Sabotage Device",{[30,[],{"obj3" setMarkerColor "ColorRED";obj3 setDamage 1;},{true},"Sabotaging Device"] call ace_common_fnc_progressBar}, [], 1 , true, false,  "", "((_target distance _this) <2)"];
  obj4 addAction ["Sabotage Device",{[45,[],{"obj4" setMarkerColor "ColorRED";obj4 setDamage 1;},{true},"Sabotaging Device"] call ace_common_fnc_progressBar}, [], 1 , true, false,  "", "((_target distance _this) <2)"];
  obj5 addAction ["Sabotage Device",{[30,[],{"obj5" setMarkerColor "ColorRED";obj5 setDamage 1;},{true},"Sabotaging Device"] call ace_common_fnc_progressBar}, [], 1 , true, false,  "", "((_target distance _this) <2)"];
};