params ["_building",["_shuffle", true], ["_step", 1]];

["filler",format["Building filler started for building %1",_building]] call SL_fnc_log;

private _buildingPositions = _building buildingPos -1;
if (_buildingPositions isEqualTo []) exitWith {
    ["filler",format ["No building positions for: %1",_building]] call SL_fnc_log;
};

if (_shuffle) then {
    [_buildingPositions, true] call CBA_fnc_shuffle;
};

private _unitTemplate = adm_camp_defaultUnitTemplate;
private _side = [_unitTemplate] call adm_common_fnc_getUnitTemplateSide;
private _grp = createGroup [_side,true];
private _unitArray = getArray (configfile >> "Admiral" >> "UnitTemplates" >> _unitTemplate >> "infantry");

private _scaledBuildingPositions = [];
for "_i" from 0 to (count _buildingPositions -1) step _step do {
    _scaledBuildingPositions pushBack (_buildingPositions select _i);
};

{
    private _unit = _grp createUnit [(selectRandom _unitArray), [0,0,0], [], 0, "NONE"];
    _unit setPosASL (AGLToASL _x);
    _unit setDir (random 360);
    [_unit, true] call ark_ai_sentry_fnc_make_sentry;
} forEach _scaledBuildingPositions;

_grp