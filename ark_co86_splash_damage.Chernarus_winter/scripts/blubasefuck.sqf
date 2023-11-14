// airplanes be rekt
sleep 600;
base_alarm = true;
[arty1, plane1, 6] spawn SL_fnc_fireArty; 
[arty2, plane2, 6] spawn SL_fnc_fireArty; 
[arty3, plane3, 6] spawn SL_fnc_fireArty;
sleep 120;
base_alarm = false;

// Some useless barracks are getting deleted.
sleep 180;
base_alarm = true;
[arty1, bbm1, 6] spawn SL_fnc_fireArty; 
[arty2, bbm2, 6] spawn SL_fnc_fireArty; 
[arty3, bbm3, 6] spawn SL_fnc_fireArty;
sleep 120;
base_alarm = false;