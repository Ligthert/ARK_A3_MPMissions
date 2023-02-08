/* I wish there was another option to add this one item (magazine) */
sleep 10;

/* Give the single user in the middle of nowhere the Satelitte Phone. */
if (player == carrier) then {
    player addMagazine "SatPhone";
};

/* Place tracker marker on the player if they have it in their inventory. */
while {true} do {
    if ("SatPhone" in (magazines player)) then {
     "satphone_marker" setMarkerPos (getPos player);
     sleep 0.5;
    };
};