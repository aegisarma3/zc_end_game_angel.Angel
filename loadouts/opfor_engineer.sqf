scriptName "OPFOR_Engineer";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "OPFOR_Engineer"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "OPFOR_Engineer", __this] call BIS_fnc_logFormat; };
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
_this forceAddUniform "rhs_uniform_mvd_izlom";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "rhs_GRD40_White";
_this addItemToUniform "rhs_30Rnd_545x39_AK";
_this addItemToUniform "rhs_mag_9x18_12_57N181S";
_this addVest "rhs_6b13_Flora_6sh92_radio";
_this addItemToVest "rhs_mag_rdg2_white";
for "_i" from 1 to 6 do {_this addItemToVest "rhs_VOG25";};
for "_i" from 1 to 2 do {_this addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_this addItemToVest "rhs_mag_9x18_12_57N181S";};
_this addHeadgear "rhs_6b28_ess";

comment "Add weapons";
_this addWeapon "rhs_weap_ak74m_gp25";
_this addPrimaryWeaponItem "rhs_acc_dtk";
_this addPrimaryWeaponItem "rhs_acc_1p63";
_this addWeapon "rhs_weap_makarov_pmm";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
