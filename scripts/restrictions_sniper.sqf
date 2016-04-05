/*
Author: Quiksilver
Last modified: 23/10/2014 ArmA 1.32 by Quiksilver
Description:

	Restricts certain weapon systems to different roles
_________________________________________________*/


#define SNIPER_MSG "Only Snipers may use this weapon system. Sniper rifle removed."

//===== SNIPER RIFLES
_snipers = ["B_sniper_F","O_sniper_F"];
_sniperSpecialised = ["srifle_GM6_F","srifle_GM6_LRPS_F","srifle_GM6_SOS_F","srifle_LRR_F","srifle_LRR_LRPS_F","srifle_LRR_SOS_F","srifle_GM6_camo_F","srifle_GM6_camo_LRPS_F","srifle_GM6_camo_SOS_F","srifle_LRR_camo_F","srifle_LRR_camo_LRPS_F","srifle_LRR_camo_SOS_F"];


while {true} do {

	//------------------------------------- Sniper Rifles

	if (({player hasWeapon _x} count _sniperSpecialised) > 0) then {
		if (({player isKindOf _x} count _snipers) < 1) then {
			player removeWeapon (primaryWeapon player);
			titleText [SNIPER_MSG,"PLAIN",3];
		};
	};


};