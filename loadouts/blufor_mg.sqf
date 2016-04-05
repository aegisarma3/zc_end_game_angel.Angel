scriptName "BLUFOR_MG";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "BLUFOR_MG"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "BLUFOR_MG", __this] call BIS_fnc_logFormat; };
_this setVariable ["BIS_hvt_loadoutType", "MG"];

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add containers";
_this forceAddUniform "rhs_uniform_cu_ocp";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "SmokeShell";
_this addItemToUniform "HandGrenade";
_this addItemToUniform "SmokeShellGreen";
_this addItemToUniform "Chemlight_green";
_this addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";
_this addVest "rhsusf_iotv_ocp_Rifleman";
_this addItemToVest "Chemlight_green";
_this addItemToVest "rhs_200rnd_556x45_M_SAW";
for "_i" from 1 to 2 do {_this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_this addBackpack "B_AssaultPack_cbr";
for "_i" from 1 to 2 do {_this addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
_this addHeadgear "rhsusf_opscore_mc_cover";
_this addGoggles "rhs_googles_yellow";

comment "Add weapons";
_this addWeapon "rhs_weap_m249_pip_L";
_this addWeapon "rhsusf_weap_m9";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
