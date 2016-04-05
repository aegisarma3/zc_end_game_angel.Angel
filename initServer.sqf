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
		"arifle_MX_Black_F",
		"arifle_MX_SW_Black_F",
		"arifle_MXC_Black_F",
		"arifle_MX_GL_Black_F",
		"arifle_MXM_Black_F",
		"hgun_Pistol_heavy_01_F",
		"hgun_P07_F",
		"SMG_01_F",
		"srifle_DMR_03_F"

	], true, false] call BIS_fnc_addVirtualWeaponCargo;

	[_x,
	[
		"optic_aco",
		"optic_Aco_smg",
		"optic_Holosight",
		"optic_hamr",
		"optic_SOS",
		"optic_nvs",
		"acc_pointer_IR",
		"acc_flashlight",
		"bipod_01_F_blk",
		"ItemGPS",
		"Rangefinder",
		"V_PlateCarrier2_rgr",
		"V_PlateCarrierGL_mtp",
		"U_B_CombatUniform_mcam",
		"U_B_CombatUniform_mcam_tshirt",
		"U_B_CombatUniform_mcam_vest",
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
		"B_AssaultPack_mcamo"

	], true, false] call BIS_fnc_addVirtualBackpackCargo;

	[_x,
	[
		"30Rnd_65x39_caseless_mag",
		"30Rnd_65x39_caseless_mag_Tracer",
		"100Rnd_65x39_caseless_mag",
		"100Rnd_65x39_caseless_mag_Tracer",
		"11Rnd_45ACP_Mag",
		"16Rnd_9x21_Mag",
		"30Rnd_45ACP_Mag_SMG_01",
		"20Rnd_762x51_Mag",
		"1Rnd_HE_Grenade_shell",
		"1Rnd_Smoke_Grenade_shell",
		"1Rnd_SmokeBlue_Grenade_shell",
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
		"arifle_Katiba_F",
		"arifle_Katiba_GL_F",
		"arifle_Katiba_C_F",
		"SMG_02_F",
		"LMG_Zafir_F",
		"hgun_Rook40_F",
		"hgun_Pistol_heavy_02_F",
		"srifle_DMR_01_F"
	], true, false] call BIS_fnc_addVirtualWeaponCargo;

	[_x,
	[
		"optic_aco_grn",
		"optic_ACO_grn_smg",
		"optic_arco",
		"optic_DMS",
		"optic_nvs",
		"acc_pointer_IR",
		"acc_flashlight",
		"bipod_02_F_blk",
		"ItemGPS",
		"Rangefinder",
		"V_HarnessO_gry",
		"V_HarnessOGL_gry",
		"U_O_CombatUniform_oucamo",
		"H_HelmetO_oucamo",
		"H_HelmetSpecO_oucamo",
		"G_Aviator",
		"G_Balaclava_blk",
		"G_Bandanna_blk",
		"G_Shades_Red",
		"G_Lowprofile",
		"FirstAidKit",
		"Medikit",
		"Toolkit",
		"MineDetector",
		"NVGoggles_opfor"
	], true, false] call BIS_fnc_addVirtualItemCargo;

	[_x,
	[
		"B_FieldPack_oucamo"

	], true, false] call BIS_fnc_addVirtualBackpackCargo;

	[_x,
	[
		"30Rnd_65x39_caseless_green",
		"30Rnd_65x39_caseless_green_mag_Tracer",
		"150Rnd_762x54_Box",
		"150Rnd_762x54_Box_Tracer",
		"10Rnd_762x54_Mag",
		"30Rnd_9x21_Mag",
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

// Fog
//0 setFog [0.5, 0.05, 0];
