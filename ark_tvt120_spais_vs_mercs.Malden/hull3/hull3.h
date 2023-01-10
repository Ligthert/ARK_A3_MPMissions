class Hull3 {
    isEnabled = 1;

    class Briefing {
        blufor = "hull3\briefing\blufor.sqf";
        opfor = "hull3\briefing\opfor.sqf";
        indfor = "hull3\briefing\indfor.sqf";
        civilian = "hull3\briefing\civilian.sqf";
    };

    class Faction {
        class MNP_MIL_WD {
            gear = "AK74_CDF";
            uniform = "LVM_WD";
        };
        class CUP_ION_PMC {
            gear = "BREN807_PMC";
            uniform = "CUP_ION_PMC";
        };
    };

    class Uniform {
        #include "SPAIS_uniform.h"
    };

    class Gear {
        #include "SPAIS.h"
        factions[] = {
            {"CUP_ION_PMC", "SPAIS"}
        };
    };

};