scriptName "OPFOR_MG";

if (!hasInterface) exitWith { ["Loadout running on dedicated server - %1", "OPFOR_MG"] call BIS_fnc_logFormat; };
waitUntil { time > 0 };
waitUntil { !isNull player };
if (!local _this) exitWith { ["Loadout where unit is not local - %1 / %2", "OPFOR_MG", __this] call BIS_fnc_logFormat; };
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
_this forceAddUniform "rhs_uniform_mvd_izlom";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "rhs_mag_rgn";
_this addVest "rhs_6b13_Flora_6sh92_radio";
_this addBackpack "rhs_sidorMG";
for "_i" from 1 to 3 do {_this addItemToBackpack "rhs_100Rnd_762x54mmR";};
_this addHeadgear "rhs_6b28_ess_bala";

comment "Add weapons";
_this addWeapon "rhs_weap_pkm";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
