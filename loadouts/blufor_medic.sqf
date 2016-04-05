scriptName "BLUFOR_Medic";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "BLUFOR_Medic"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "BLUFOR_Medic", __this] call BIS_fnc_logFormat; };
_this setVariable ["BIS_hvt_loadoutType", "Medic"];

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
for "_i" from 1 to 3 do {_this addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_this addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";
_this addVest "rhsusf_iotv_ocp_SAW";
_this addItemToVest "SmokeShell";
_this addItemToVest "SmokeShellGreen";
_this addItemToVest "SmokeShellBlue";
_this addItemToVest "SmokeShellOrange";
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
for "_i" from 1 to 2 do {_this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_this addBackpack "B_AssaultPack_cbr";
for "_i" from 1 to 2 do {_this addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {_this addItemToBackpack "FirstAidKit";};
_this addHeadgear "rhsusf_opscore_mc_cover";
_this addGoggles "rhs_googles_orange";

comment "Add weapons";
_this addWeapon "rhs_weap_m4";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addWeapon "rhsusf_weap_m9";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
