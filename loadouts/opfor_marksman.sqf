scriptName "OPFOR_Marksman";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "OPFOR_Marksman"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "OPFOR_Marksman", __this] call BIS_fnc_logFormat; };
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
_this forceAddUniform "rhs_uniform_mvd_izlom";
_this addItemToUniform "FirstAidKit";
for "_i" from 1 to 7 do {_this addItemToUniform "rhs_10Rnd_762x54mmR_7N1";};
_this addVest "rhs_6b13_Flora_6sh92_radio";
for "_i" from 1 to 2 do {_this addItemToVest "rhs_mag_rdg2_white";};
for "_i" from 1 to 3 do {_this addItemToVest "rhs_mag_9x18_12_57N181S";};
_this addHeadgear "rhs_6b28_bala";
_this addGoggles "G_Aviator";

comment "Add weapons";
_this addWeapon "rhs_weap_svdp_pso1";
_this addPrimaryWeaponItem "rhs_acc_pso1m2";
_this addWeapon "rhs_weap_makarov_pmm";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
