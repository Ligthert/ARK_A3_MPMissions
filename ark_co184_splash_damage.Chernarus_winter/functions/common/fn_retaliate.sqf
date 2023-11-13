// [ _veh, _rounds, _tgt, _var ] spawn SL_fnc_retaliate;

params [ _veh, _rounds, _tgt, _var ];

["retalliate", format["Retaliation with %3 firing %1 round(s) fucking up %2",_rounds, _tgt, _veh] ] call SL_fnc_log;

// _veh		: artillery unit
// _rounds	: number of units
// _tgt		: an object that needs to get hit
// _var 	: Var that triggers an alarm sounding off

// Sound the alarm
_var = true;

// Fire the arty
[_veh, _tgt, _rounds] spawn SL_fnc_fireArty;

// Sleep long enough to warn people before and after
sleep 120;

// Shut off the alarm
_var = false;
