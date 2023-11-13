// Spawning stuff in the background.
// Calls are blocking
_avgPos = ["ao"] spawn SL_fnc_avgPlayerPos;
_drnMan = [] spawn SL_fnc_drone_manager;

execVM "scripts\blubasefuck.sqf";