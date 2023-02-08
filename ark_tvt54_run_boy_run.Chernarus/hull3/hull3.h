class Hull3 {
    isEnabled = 1;

    class Briefing {
        blufor = "hull3\briefing\blufor.sqf";
        opfor = "hull3\briefing\opfor.sqf";
        indfor = "hull3\briefing\indfor.sqf";
        civilian = "hull3\briefing\civilian.sqf";
    };

    class Faction {
        class USM_USMC_90_WD {
            gear = "M16A4_USMC";
            uniform = "USM_USMC_90_WD";
        };

        class CUP_RU_90_WD {
            gear = "AK74_RU";
            uniform = "CUP_RU_90_WD";
        };

        class CUP_NAPA_WD {
            gear = "AKM_NAPA";
            uniform = "CUP_NAPA_WD";
        };
    };
};