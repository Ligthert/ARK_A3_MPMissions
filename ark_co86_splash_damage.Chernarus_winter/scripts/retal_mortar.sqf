["retalliate", "Starting retaliation: Mortar Base" ] call SL_fnc_log;

// Sound the alarm
mortar_alarm = true;

// Fire the arty
[arty1, mortar1, 2] spawn SL_fnc_fireArty;
sleep 2;
[arty2, mortarbase2, 2] spawn SL_fnc_fireArty;
sleep 2;
[arty3, mortarfield, 2] spawn SL_fnc_fireArty;

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
mortar_alarm = false;