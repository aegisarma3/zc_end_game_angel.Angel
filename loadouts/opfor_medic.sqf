scriptName "OPFOR_Medic";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "OPFOR_Medic"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "OPFOR_Medic", _this] call BIS_fnc_logFormat; };
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
_this forceAddUniform "rhs_uniform_mvd_izlom";
_this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToUniform "rhs_30Rnd_545x39_AK";};
_this addVest "rhs_6b13_Flora_6sh92_headset_mapcase";
_this addItemToVest "rhs_mag_rgn";
_this addItemToVest "rhs_30Rnd_545x39_AK";
for "_i" from 1 to 3 do {_this addItemToVest "rhs_mag_9x18_12_57N181S";};
_this addBackpack "rhs_assault_umbts_medic";
for "_i" from 1 to 2 do {_this addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {_this addItemToBackpack "FirstAidKit";};
_this addHeadgear "rhs_6b28";
_this addGoggles "rhs_scarf";

comment "Add weapons";
_this addWeapon "rhs_weap_ak74m";
_this addPrimaryWeaponItem "rhs_acc_dtk";
_this addPrimaryWeaponItem "rhs_acc_2dpZenit";
_this addWeapon "rhs_weap_makarov_pmm";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
