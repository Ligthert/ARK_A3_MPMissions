["retalliate", "Starting retaliation of the Mortar Base" ] call SL_fnc_log;

// Sound the alarm
mortar_alarm = true;

// Fire the arty
[arty1, mortar1, 1] spawn SL_fnc_fireArty;
sleep random 2;
[arty2, mortarbase2, 1] spawn SL_fnc_fireArty;
sleep random 2;
[arty3, mortarfield, 1] spawn SL_fnc_fireArty;

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
mortar_alarm = false;