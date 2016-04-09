["Initialize"] call BIS_fnc_dynamicGroups;

enableSaving [false, false];
EnableEnvironment False;

[east, 40] call BIS_fnc_respawnTickets;
[west, 40] call BIS_fnc_respawnTickets;



/**
 * Triggered every time a side's middle game objective changes state
 * Is triggered only on the server
 */
[missionNamespace, "EndGame_OnObjectiveStateChanged",
{
	private ["_objective", "_side", "_newStateFor"];
	_objective 		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_side			= [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;
	_newStateFor		= [_this, 2, "", [""]] call BIS_fnc_param;

	if (_newStateFor == "Succeed") then
	{
		_addEquipment = execFSM "AddEquipment.fsm";
	};
}] call BIS_fnc_addScriptedEventHandler;

// Variables for rewards FSM

BIS_west01_reward = false;
BIS_west02_reward = false;
BIS_west03_reward = false;
BIS_east01_reward = false;
BIS_east02_reward = false;
BIS_east03_reward = false;

// Setting slingload for support helicopters
//BIS_Huron setSlingLoad BIS_Hunter;
//BIS_Taru setSlingLoad BIS_Ifrit;

// Virtual arsenal
{
	["AmmoboxInit",[_x, false,{side group player == WEST}]] call BIS_fnc_arsenal;
} forEach [BIS_west_holder_1, BIS_west_holder_2];

{
	["AmmoboxInit",[_x, false,{side group player == EAST}]] call BIS_fnc_arsenal;
} forEach [BIS_east_holder_1, BIS_east_holder_2];

// Disable simulation on all objects
{
	if (isNil { _x getVariable "BIS_hvt_keepSimulationEnabled" }) then
	{
		if (isMultiplayer) then
		{
			_x enableSimulationGlobal false;
		}
		else
		{
			_x enableSimulation false;
		};
	};
} forEach (allMissionObjects "ThingX");

// Add items to ammo boxes to be used with Virtual Arsenal
{
	[_x,
	[
		"rhs_weap_m4",
		"rhs_weap_m4_carryhandle",
		"rhs_weap_m4_grip",
		"rhs_weap_m4_m203",
		"rhs_weap_m4a1_grip",
		"rhs_weap_m4a1_m320",
		"rhs_weap_m240B",
		"rhsusf_mag_6Rnd_M433_HEDP",
		"rhsusf_weap_m9",
		"rhs_weap_m14ebrri"

	], true, false] call BIS_fnc_addVirtualWeaponCargo;

	[_x,
	[
		"optic_aco",
		"optic_Aco_smg",
		"optic_Holosight",
		"optic_hamr",
		"optic_SOS",
		"acc_pointer_IR",
		"acc_flashlight",
		"bipod_01_F_blk",
		"ItemGPS",
		"Rangefinder",
		"H_Bandanna_mcamo",
		"H_Booniehat_mcamo",
		"H_Cap_tan_specops_US",
		"H_Cap_usblack",
		"H_HelmetB_snakeskin",
		"H_HelmetB",
		"H_MilCap_mcamo",
		"H_Watchcap_khk",
		"G_Aviator",
		"G_Balaclava_blk",
		"G_Balaclava_oli",
		"G_Bandanna_khk",
		"G_Shades_Blue",
		"G_Lowprofile",
		"ACE_ATragMX",
		"ACE_Vector",
		"ACE_SpareBarrel",
		"ACE_NVG_Gen3",
		"ACE_MapTools",
		"ACE_Kestrel4500",
		"ACE_Flashlight_XL50",
		"ACE_Flashlight_KSF1",
		"ACE_Flashlight_MX991",
		"ACE_DeadManSwitch",
		"ACE_Clacker",
		"ACE_M26_Clacker",
		"ACE_DefusalKit",
		"ACE_EarPlugs",
		"ACE_RangeCard",
		"ACE_microDAGR",
		"ACE_fieldDressing",
		"ACE_morphine",
		"ACE_epinephrine",
		"ACE_bloodIV",
		"ACE_bloodIV_500",
		"ACE_bloodIV_250",
		"Toolkit",
		"MineDetector",
		"NVGoggles"
	], true, false] call BIS_fnc_addVirtualItemCargo;

	[_x,
	[
		"B_Kitbag_cbr",
		"rhsusf_assault_eagleaiii_ocp"

	], true, false] call BIS_fnc_addVirtualBackpackCargo;

	[_x,
	[
		"rhsusf_20Rnd_762x51_m118_special_Mag",
		"rhsusf_20Rnd_762x51_m993_Mag",
		"30Rnd_556x45_Stanag",
		"30Rnd_556x45_Stanag_Tracer_Green",
		"30Rnd_556x45_Stanag_Tracer_Red",
		"30Rnd_556x45_Stanag_Tracer_Yellow",
		"rhs_200rnd_556x45_M_SAW",
		"rhs_200rnd_556x45_T_SAW",
		"rhs_200rnd_556x45_B_SAW",
		"rhsusf_50Rnd_762x51",
		"rhsusf_50Rnd_762x51_m61_ap",
		"rhsusf_50Rnd_762x51_m62_tracer",
		"rhsusf_50Rnd_762x51_m80a1epr",
		"rhsusf_100Rnd_762x51",
		"rhsusf_100Rnd_762x51_m61_ap",
		"rhsusf_100Rnd_762x51_m62_tracer",
		"rhsusf_100Rnd_762x51_m80a1epr",
		"rhsusf_50Rnd_762x51_m993",
		"rhsusf_100Rnd_762x51_m993",
		"rhsusf_mag_6Rnd_M441_HE",
		"rhsusf_mag_6Rnd_M433_HEDP",
		"rhsusf_mag_6Rnd_M714_white",
		"rhsusf_mag_6Rnd_M576_Buckshot",
		"rhsusf_m112_mag",
		"rhsusf_m112x4_mag",
		"rhs_mag_m18_green",
		"rhs_mag_m18_purple",
		"rhs_mag_m18_red",
		"rhs_mag_m18_yellow",
		"rhsusf_mag_7x45acp_MHP",
		"rhsusf_mag_17Rnd_9x19_FMJ",
		"rhsusf_mag_17Rnd_9x19_JHP",
		"rhsusf_mag_15Rnd_9x19_FMJ",
		"rhsusf_mag_15Rnd_9x19_JHP",
		"1Rnd_HE_Grenade_shell",
		"1Rnd_Smoke_Grenade_shell",
		"1Rnd_SmokeBlue_Grenade_shell",
		"rhs_VOG25",
		"HandGrenade",
		"MiniGrenade",
		"SmokeShell",
		"SmokeShellBlue",
		"Chemlight_yellow",
		"Chemlight_blue"
	], true, false] call BIS_fnc_addVirtualMagazineCargo;
} forEach [BIS_west_holder_1, BIS_west_holder_2];

{
	[_x,
	[
	"rhs_weap_ak74m",
	"rhs_weap_ak74m_2mag",
	"rhs_weap_ak74m_2mag_camo",
	"rhs_weap_ak103",
	"rhs_weap_ak103_1",
	"rhs_weap_ak103_2",
	"rhs_weap_ak103_gp25",
	"rhs_weap_akm",
	"rhs_weap_akm_gp25",
	"rhs_weap_akms",
	"rhs_weap_akms_gp25",
	"rhs_weap_pkm",
	"rhs_weap_pkp",
	"rhs_weap_svdp",
	"rhs_weap_svdp_npz",
	"rhs_weap_svdp_wd",
	"rhs_weap_makarov_pmm"
	], true, false] call BIS_fnc_addVirtualWeaponCargo;

	[_x,
	[
	"optic_aco",
	"optic_Aco_smg",
	"optic_Holosight",
	"optic_hamr",
	"optic_SOS",
	"acc_pointer_IR",
	"acc_flashlight",
	"bipod_01_F_blk",
	"ItemGPS",
	"Rangefinder",
	"H_Bandanna_mcamo",
	"H_Booniehat_mcamo",
	"H_Cap_tan_specops_US",
	"H_Cap_usblack",
	"H_HelmetB_snakeskin",
	"H_HelmetB",
	"H_MilCap_mcamo",
	"H_Watchcap_khk",
	"G_Aviator",
	"G_Balaclava_blk",
	"G_Balaclava_oli",
	"G_Bandanna_khk",
	"G_Shades_Blue",
	"G_Lowprofile",
	"ACE_ATragMX",
	"ACE_Vector",
	"ACE_SpareBarrel",
	"ACE_NVG_Gen3",
	"ACE_MapTools",
	"ACE_Kestrel4500",
	"ACE_Flashlight_XL50",
	"ACE_Flashlight_KSF1",
	"ACE_Flashlight_MX991",
	"ACE_DeadManSwitch",
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_EarPlugs",
	"ACE_RangeCard",
	"ACE_microDAGR",
	"ACE_fieldDressing",
	"ACE_morphine",
	"ACE_epinephrine",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	"Toolkit",
	"MineDetector",
	"NVGoggles"
	], true, false] call BIS_fnc_addVirtualItemCargo;

	[_x,
	[
		"rhs_sidorMG",
		"rhs_assault_umbts"

	], true, false] call BIS_fnc_addVirtualBackpackCargo;

	[_x,
	[
		"rhs_30Rnd_545x39_AK",
		"rhs_30Rnd_545x39_AK_no_tracers",
		"rhs_30Rnd_545x39_AK_green",
		"rhs_30Rnd_545x39_7N10_AK",
		"rhs_30Rnd_545x39_7N22_AK",
		"rhs_30Rnd_545x39_7U1_AK",
		"rhs_45Rnd_545X39_7N22_AK",
		"rhs_45Rnd_545X39_7N10_AK",
		"rhs_45Rnd_545X39_AK_Green",
		"rhs_45Rnd_545X39_AK",
		"rhs_45Rnd_545X39_7U1_AK",
		"rhs_30Rnd_762x39mm",
		"rhs_30Rnd_762x39mm_tracer",
		"rhs_30Rnd_762x39mm_89",
		"rhs_30Rnd_762x39mm_U",
		"rhs_20rnd_9x39mm_SP5",
		"rhs_20rnd_9x39mm_SP6",
		"rhs_100Rnd_762x54mmR",
		"rhs_100Rnd_762x54mmR_green",
		"rhs_10Rnd_762x54mmR_7N1",
		"rhs_mag_9x19_17",
		"rhs_mag_9x18_12_57N181S",
		"rhs_VOG25",
		"16Rnd_9x21_Mag",
		"6Rnd_45ACP_Cylinder",
		"1Rnd_HE_Grenade_shell",
		"1Rnd_Smoke_Grenade_shell",
		"1Rnd_SmokeRed_Grenade_shell",
		"HandGrenade",
		"MiniGrenade",
		"SmokeShell",
		"SmokeShellRed",
		"Chemlight_yellow",
		"Chemlight_red"
	], true, false] call BIS_fnc_addVirtualMagazineCargo;
} forEach [BIS_east_holder_1, BIS_east_holder_2];
