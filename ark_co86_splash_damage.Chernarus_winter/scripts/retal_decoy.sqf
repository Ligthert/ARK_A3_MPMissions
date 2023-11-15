["retalliate", "Starting retaliation: Decoy Base" ] call SL_fnc_log;

// Sound the alarm
decoy_alarm = true;

// Give a hint to the player where they do need to be.
[art1, whoopsie, 6] spawn SL_fnc_fireArty;
sleep 3;
[art2, whoopsie, 6] spawn SL_fnc_fireArty;
sleep 3;
[art3, whoopsie, 6] spawn SL_fnc_fireArty;

sleep 15;

// Fire the arty at the decoy base
[mortar1, decoy_barack_1, 1] spawn SL_fnc_fireArty;
sleep random 2;
[mortar2, decoy_base, 1] spawn SL_fnc_fireArty;
sleep random 2;
[mortar3, decoy_tent, 1] spawn SL_fnc_fireArty;

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
decoy_alarm = false;

