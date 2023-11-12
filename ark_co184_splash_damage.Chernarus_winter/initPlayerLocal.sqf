ark_script_fnc_foggyBreath = {
    waituntil {!isnull (finddisplay 46)};
 
    while {alive player} do {
        private _nearMen = player nearEntities ["Man", 40];
        {
            if (vehicle _x == _x) then {
                    if (_x distance player < 40) then {
                        private _pos = _x selectionposition "neck";
                        private _ps = "#particlesource" createvehiclelocal (getpos _x);
                        _ps setparticleparams [
                        [ "a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 13, 0],
                        "",
                        "Billboard",
                        0.5,
                        0.5,
                        [_pos select 0, (_pos select 1) + 0.15, _pos select 2],
                        [0, 0.2, -0.2],
                        1,1.275,1,0.2,
                        [0, 0.2, 0],
                        [[1, 1, 1, 0.07],
                        [1, 1, 1, 0.07],
                        [1, 1, 1, 0]],
                        [1000],
                        1,
                        0.04,
                        "",
                        "",
                        _x];
                        _ps setparticlerandom [ 2, [ 0, 0, 0], [ 0.25, 0.25, 0.25], 0, 0.5, [ 0, 0, 0, 0.2], 0, 0, 10];
                        _ps setdropinterval 0.01;
                        uiSleep 1;
                        deletevehicle _ps;
                    };
            };
            uiSleep 0.25;
        } foreach _nearMen;
    uiSleep random [1,3,5];
    };
};
 
[] spawn ark_script_fnc_foggyBreath;