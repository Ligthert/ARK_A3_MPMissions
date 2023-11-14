/*
	Fitting Soundtrack: https://www.youtube.com/watch?v=AAOcr8f1ldM
*/

params ["_sites","_targets", "_count"];

// Arty Sites -- List of arty/mortar pieces
// _sites = [ [arty1, arty2, arty3], [mortar1, mortar2, mortar3] ]
//
// If all of the arty pieces should be alive for a site to be viable.
// If this isn't the case, move on to the next site. Redundancy baby!

// Targets -- List of objects to shoot at
// _targets = [ tgt1, tgt2, tgt3 ]
// Iterate through this and halt because we ran out of arty pieces of shit to shoot at.


// Prep
["retaliation", format ["Starting retaliation: sites=%1; targets=%2;", _sites, _targets] ] call SL_fnc_log;
private ["_site","_sites_counter","_tmp_site","_viable"];


// Phase 1 - Selecting an arty site
_sites_counter = 0;

while {_sites_counter < (count _sites)} do {
	private _viable = true;

	_tmp_site = (_sites select _sites_counter);

	{
	    if (not canFire _x) then {
	      _viable = false;
	    };
	} forEach _tmp_site;

	if (_viable == true) then {
		_site = _sites select _sites_counter;
		_sites_counter = 9001;
	} else {
		_sites_counter = _sites_counter + 1;
	};

};

if (count _site == 0) then {
	["retaliation","No sites, exiting"] call SL_fnc_log;
	exit;
};

["retaliation", format ["Arty units: %1", _site] ] call SL_fnc_log;
["retaliation", format ["Target pos: %1", _targets] ] call SL_fnc_log;


// Phase 2 - Shoot things! =)
// Shoot your shot -- https://www.youtube.com/watch?v=IUEfYpARJCw
private _sites_nr = count _site;
private _trgts_nr = count _targets;

private _shots = 0;

if (_sites_nr < _trgts_nr) then {
	_shots = _sites_nr;
} else {
	_shots = _trgts_nr;
};

_targets = _targets call BIS_fnc_arrayShuffle;

for "_i" from 0 to (_shots-1) do {
	[ (_site select _i), (_targets select _i), _count ] spawn SL_fnc_fireArty;
	sleep random 2;
};