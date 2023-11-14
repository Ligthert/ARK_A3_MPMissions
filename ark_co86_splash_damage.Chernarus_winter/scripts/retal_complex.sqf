["retalliate", "Starting retaliation: Bunker complex" ] call SL_fnc_log;

// Sound the alarm
complex_alarm = true;

// Fire the arty, or mortars
[ [ [arty1, arty2, arty3], [mortar1, mortar2, mortar3] ],  [trench_complex, complex1, complex2], 3 ] execVM "scripts\retaliation.sqf";

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
complex_alarm = false;