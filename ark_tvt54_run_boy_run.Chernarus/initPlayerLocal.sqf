/* Give the single user in the middle of nowhere the Satelitte Phone. */
[{player getVariable ["hull3_gear_isAssgined", false]}, {
    if (player == carrier) then {
        player addMagazine "SatPhone";
    };
}] call CBA_fnc_waitUntilAndExecute;
// Provided by Cyruz

/* Place tracker marker on the player if they have it in their inventory. */
while {true} do {
    if ("SatPhone" in (magazines player)) then {
     "satphone_marker" setMarkerPos (getPos player);
     sleep 0.5;
    };
};