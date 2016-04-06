scriptName "BLUFOR_Engineer";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "BLUFOR_Engineer"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "BLUFOR_Engineer", _this] call BIS_fnc_logFormat; };
_this setVariable ["BIS_hvt_loadoutType", "Engineer"];

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
_this addItemToUniform "ACE_Clacker";
_this addItemToUniform "ACE_DefusalKit";
_this addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_this addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_this addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";
_this addVest "rhsusf_iotv_ucp_Repair";
_this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
for "_i" from 1 to 3 do {_this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_this addBackpack "B_Kitbag_cbr";
_this addItemToBackpack "ToolKit";
for "_i" from 1 to 3 do {_this addItemToBackpack "MineDetector";};
_this addItemToBackpack "SatchelCharge_Remote_Mag";
for "_i" from 1 to 3 do {_this addItemToBackpack "DemoCharge_Remote_Mag";};
_this addHeadgear "rhsusf_opscore_mc_cover_pelt";
_this addGoggles "G_Aviator";

comment "Add weapons";
_this addWeapon "rhs_weap_m4";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "rhsusf_acc_eotech_552";
_this addWeapon "rhsusf_weap_m9";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
