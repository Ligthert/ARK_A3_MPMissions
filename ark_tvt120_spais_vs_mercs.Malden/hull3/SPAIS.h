class SPAIS {
    class Rifleman {
        primaryWeapon = "";
        primaryWeaponItems[] = {};
        secondaryWeapon = "";
        secondaryWeaponItems[] = {};
        handgunWeapon = "CUP_hgun_Glock17";
        handgunItems[] = {"muzzle_snds_L"};
        uniformWeapons[] = {};
        vestWeapons[] = {};
        backpackWeapons[] = {};
        uniformMagazines[] = {"CUP_17Rnd_9x19_glock17","CUP_17Rnd_9x19_glock17","CUP_17Rnd_9x19_glock17","CUP_17Rnd_9x19_glock17"};
        vestMagazines[] = {};
        backpackMagazines[] = {};
        basicAssignItems[] = {};
        assignItems[] = {};
        binocular = "";
        uniformItems[] = {
            {"ACE_Flashlight_XL50", 1},
            {"ACE_wirecutter", 1},
            {"ACE_EntrenchingTool", 1}
        };
        vestItems[] = {};
        backpackItems[] = {};
        uniformRadios[] = {};
        vestRadios[] = {};
        backpackRadios[] = {};
        uniformMedicalItems[] = {};
        vestMedicalItems[] = {};
        backpackMedicalItems[] = {};
        code = "";
        // These will override the uniform template, if not empty
        headGear = "CUP_H_FR_Headset";
        uniform = "U_C_FormalSuit_01_black_F";
        goggles = "ACE_NVG_Wide";
        vest = "";
        backpack = "";
    };

    class Vehicle {
        weapons[] = {};
        magazines[] = {};
        items[] = {};
        radios[] = {};
        medicalItems[] = {};
        code = "";
    };
};