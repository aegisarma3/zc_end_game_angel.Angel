scriptName "BLUFOR_Marksman";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "BLUFOR_Marksman"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "BLUFOR_Marksman", __this] call BIS_fnc_logFormat; };
_this setVariable ["BIS_hvt_loadoutType", "Marksman"];


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
for "_i" from 1 to 2 do {_this addItemToUniform "rhsusf_20Rnd_762x51_m118_special_Mag";};
_this addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";
_this addVest "rhsusf_iotv_ocp_Rifleman";
_this addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";
for "_i" from 1 to 2 do {_this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_this addHeadgear "rhsusf_opscore_mc_cover";
_this addGoggles "rhs_googles_orange";

comment "Add weapons";
_this addWeapon "rhs_weap_m14ebrri";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "rhsusf_acc_ACOG2_USMC";
_this addPrimaryWeaponItem "bipod_01_F_blk";
_this addWeapon "rhsusf_weap_m9";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
