["retalliate", "Starting retaliation: FOB" ] call SL_fnc_log;

// Sound the alarm
fob_alarm = true;

// Fire the arty, or mortars
[ [ [mortar1, mortar2, mortar3], [arty1, arty2, arty3] ],  [fob1, fob2, fob3], 3 ] execVM "scripts\retaliation.sqf";

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
fob_alarm = false;