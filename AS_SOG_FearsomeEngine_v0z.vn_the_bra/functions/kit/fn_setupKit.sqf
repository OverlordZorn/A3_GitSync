if (!hasInterface) exitWith {};

sleep 2;

_hashMap = createHashMapFromArray [

    [
        "placeholder", [
            "ace_banana",
            ""
    ]],
    
    ["Drip", [
        "//H_HelmetB_plain_sb_khaki_RF",
        "H_Booniehat_khk",
        "H_Booniehat_khk_hs",

        "H_Watchcap_khk_hs",
        "H_Watchcap_khk",
        "H_Watchcap_blk_hs",
        "H_Watchcap_camo_hs",
        "H_Watchcap_camo",
        "H_Watchcap_cbr_hs",
        "H_Watchcap_cbr",
        "H_Watchcap_blk",
        "H_Beret_blk"
    ]],

    [
        "uniforms",[
        "Atlas_U_O_Afghanka_01_khk_F",
        "Atlas_U_O_Afghanka_02_khk_F",
        "Atlas_U_O_Afghanka_02_ruarid_F",
        "Atlas_U_O_Afghanka_01_ruarid_F"
    ]],
    ["vests",[
        "Aegis_V_OCarrierLuchnik_khk_F",
        "Aegis_V_OCarrierLuchnik_arid_F",
        "Aegis_V_OCarrierLuchnik_Lite_khk_F",
        "V_SmershVest_01_radio_olive_F",
        "V_SmershVest_01_olive_F"
    ]],
    ["helmets",[
        "H_HelmetLuchnik_cover_khk_F",
        "H_HelmetLuchnik_cover_ruarid_F",
        "H_HelmetHeavy_VisorUp_Olive_RF",
        "H_HelmetHeavy_Simple_Olive_RF",
        "H_HelmetHeavy_Olive_RF",
        "H_HelmetHeavy_VisorUp_Black_RF",
        "H_HelmetHeavy_Simple_Black_RF",
        "H_HelmetHeavy_Black_RF",
        "H_HelmetHeavy_Sand_RF",
        "H_HelmetHeavy_Simple_Sand_RF",
        "H_HelmetHeavy_VisorUp_Sand_RF"
    ]],
    ["backpacks",[
        "B_Messenger_Coyote_F",
        "B_Messenger_Black_F",
        "B_LegStrapBag_coyote_F",
        "B_LegStrapBag_black_F",
        "B_Kitbag_aucamo_F",
        "B_Kitbag_blk",
        "B_Kitbag_khk"
    ]],

    ["face", [
        "G_Combat_lxWS",
        "G_Balaclava_snd_lxWS",
        "G_Balaclava_blk_lxWS",
        "G_Balaclava_blk",
        "G_Bandanna_oli",
        "G_Bandanna_khk",
        "G_Bandanna_blk",
        "G_Shemag_khk",
        "G_Shemag_oli",
        "G_Shemag_red",
        "G_Shemag_tan",
        "G_Shemag_white",
        "Aegis_G_Armband_IND_alt_F",
        "Aegis_G_Armband_BLU_alt_F",
        "Aegis_G_Armband_OPF_alt_F"
    ]],


    ["rifles", [
        "arifle_AK12_545_F",
        "arifle_AK12U_545_F"
    ]],


    ["mags", [
        "30Rnd_545x39_Black_Mag_Tracer_Yellow_F",
        "30Rnd_545x39_Black_Mag_Tracer_F",
        "30Rnd_545x39_Black_Mag_Yellow_F",
        "30Rnd_545x39_Black_Mag_F"
    ]],

    ["rifles_MG", [
        "Aegis_arifle_RPK12_545_F"
    ]],

    ["mags_mg", [
        "Aegis_60Rnd_545x39_Mag_Tracer_F",
        "Aegis_60Rnd_545x39_Mag_Tracer_Green_F",
        "Aegis_60Rnd_545x39_Mag_F",
        "Aegis_60Rnd_545x39_Mag_Green_F"
    ]],

    ["rifles_GL", [
        "arifle_AK12_GL_545_F"
    ]],

    ["mags_GL ", [
        "30Rnd_545x39_Black_Mag_Tracer_Yellow_F",
        "30Rnd_545x39_Black_Mag_Tracer_F",
        "30Rnd_545x39_Black_Mag_Yellow_F",
        "30Rnd_545x39_Black_Mag_F",

        "1Rnd_SmokeBlue_Grenade_shell",
        "1Rnd_SmokeGreen_Grenade_shell",
        "1Rnd_Smoke_Grenade_shell",
        "1Rnd_SmokeRed_Grenade_shell",
        "UGL_FlareWhite_F",
        "UGL_FlareRed_F",
        "1Rnd_HEDP_Grenade_shell",
        "1Rnd_HE_Grenade_shell"
    ]],

    ["AT", [
        "RPG32_F",
        "RPG32_HE_F",
        "launch_RPG32_camo_F"
    ]],

    ["muzzle", [
        "aegis_muzzle_snds_pbs_545_blk"
    ]],

    ["bipod", [
        "bipod_01_F_blk",
        "bipod_02_F_blk",
        "bipod_03_F_blk"
    ]],


    ["optic", [
        "Aegis_optic_ROS",
        "Aegis_optic_ICO",
        "optic_Hamr",
        "optic_MRCO"
    ]],


    ["rail", [
        "acc_flashlight",
        "ACE_acc_pointer_green",
        "ACE_SPIR",
        "ACE_DBAL_A3_Red",
        "ACE_DBAL_A3_Green"
    ]],


    ["sideArm", [
        "hgun_Rook40_F",
        "17Rnd_9x21_Mag",
        "muzzle_snds_L"
    ]],

    ["thrown", [
        "Chemlight_blue",
        "Chemlight_red",
        
        "SmokeShellYellow",
        "SmokeShellRed",
        "SmokeShellPurple",
        "SmokeShellOrange",
        "SmokeShellGreen",
        "SmokeShellBlue",
        "SmokeShell",

        "HandGrenade_Guer",
        "HandGrenade_East"
    ]],

    ["binocs", ["Binocular", "ACE_Yardage450"]],

    // ["nvg", [
        // "ACE_NVGoggles_OPFOR_WP"
    // ]],

    ["explosives", ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"]],

    ["acre", ["ACRE_PRC148"]],
    ["medical", [

        "ACE_salineIV_250",
        "ACE_salineIV_500",
        "ACE_salineIV",
        "ACE_plasmaIV_250",
        "ACE_plasmaIV_500",
        "ACE_plasmaIV",
        "ACE_bodyBag",
        "ACE_bloodIV_250",
        "ACE_bloodIV_500",
        "ACE_bloodIV",

        "ACE_packingBandage",
        "ACE_quikclot",
        "ACE_elasticBandage",
        "ACE_fieldDressing",

        "ACE_personalAidKit",

        "ACE_morphine",
        "ACE_epinephrine",
        "ACE_atropine",

        "ACE_tourniquet",
        "ACE_surgicalKit",
        "ace_suture"
    ]],

    ["tools", [

        "ACE_WaterBottle",
        "ACE_SpareBarrel",

        "ACE_SpraypaintBlack",
        "ACE_SpraypaintBlue",
        "ACE_SpraypaintGreen",
        "ACE_SpraypaintRed",
        "ACE_SpraypaintWhite",
        "ACE_SpraypaintYellow",

        "ACE_CableTie",
        "ACE_EarPlugs",

        "ACE_RangeCard",
        "ACE_PlottingBoard",

        "acex_intelitems_notepad",

        "ACE_microDAGR",   

        "ACE_wirecutter",
        "ACE_EntrenchingTool",

        "ACE_DefusalKit"
    ]]
];

{player removeMagazine _x} forEach magazines player;

// Stores content of containers, changes containers, reapplies content of each container. also removes all weapons.

_items_uniform = uniformItems player;
_items_vest = vestItems player;
_items_backpack = backpackItems player;

removeUniform player;
removeVest player;
removeBackpack player;

{player removeWeapon _x;} forEach weapons player;

{player addItemToVest _x} forEach (_hashMap get "acre");

player forceAddUniform selectRandom (_hashMap get "uniforms");
player addVest selectRandom (_hashMap get "vests");
player addBackpack selectRandom (_hashMap get "backpacks");

{ player addItemToUniform _x; } forEach _items_uniform;
{ player addItemToVest _x; } forEach _items_vest;
{ player addItemToBackpack _x; } forEach _items_backpack;

// remove Helmet and Facegear and add random.
removeHeadgear player;
player addHeadgear selectRandom (_hashMap get "helmets");

removeGoggles player;
player addGoggles selectRandom (_hashMap get "face");


// adds random weapon and attachements (simply applies raandom cause everything fits all available guns)
_rifle = selectRandom (_hashMap get "rifles");
player addWeapon _rifle;

{
    player addWeaponItem [_rifle,_x,true];
    diag_log format ["%1, %2", _x, _x];
} forEach [
    selectRandom (_hashMap get "muzzle"),
    selectRandom (_hashMap get "rail"),
    selectRandom (_hashMap get "bipod"),
    selectRandom (_hashMap get "optic"),
    selectRandom (_hashMap get "mags")
];



// Creates array of all defined items and adds those to the "arsenal" box as ace arsenal
private _arsenalArray = [];

//{ _arsenalArray array insert [-1, _y, true]; } forEach _hashMap;
//{ _arsenalArray pushback [-1, _y, true]; } forEach _hashMap;
//{ _arsenalArray append _y; } forEach _hashMap;
{ _arsenalArray insert [-1, _y, true]; } forEach _hashMap;

//creates the arsenal
[arsenal, _arsenalArray, false] call ace_arsenal_fnc_initBox;
arsenal setVariable ["ace_cargo_noRename", true, false];
hint (str _arsenalArray);