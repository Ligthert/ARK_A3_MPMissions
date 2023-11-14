["retalliate", "Starting retaliation: Decoy Base" ] call SL_fnc_log;

// Sound the alarm
decoy_alarm = true;

// Fire the arty
[mortar1, decoy_barack_1, 1] spawn SL_fnc_fireArty;
sleep random 2;
[mortar2, decoy_base, 1] spawn SL_fnc_fireArty;
sleep random 2;
[mortar3, decoy_tent, 1] spawn SL_fnc_fireArty;

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
decoy_alarm = false;