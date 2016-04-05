// Add the following variables to your init.sqf at the top with your own values or add them as parameters in the CfgParams
//TKP_MAX_TK_BEFORE_KICK = 3;
//TKP_MAX_TK_BEFORE_BAN = 6;
//TKP_LOSE_SCORE = -10;
//TKP_USE_EXTERNAL_FILE = 1; // 1 = Means that you use an external file tkp_uids.sqf placed at the root of your ArmA Server folder.

// Add the following strings in your translation file. If you don't, default messages will be added.
TKP_STOP_TEAMKILL_MSG = localize "STR_TKP_STOP_TEAMKILL";
TKP_STOP_TEAMKILL_KICK_MSG = localize "STR_TKP_STOP_TEAMKILL";
TKP_HAS_TEAMKILLED_MSG = localize "STR_TKP_STOP_TEAMKILL";
TKP_HAS_TEAMKILLED_AND_KICKED_MSG = localize "STR_TKP_STOP_TEAMKILL";
TKP_IS_BANNED_MSG = localize "STR_TKP_STOP_TEAMKILL";


//----------------------- DO NOT EDIT FROM HERE ---------------------------
private ["_conf","_paramName","_paramval","_names"];
_names = ["TKP_USE_EXTERNAL_FILE","TKP_MAX_TK_BEFORE_KICK","TKP_MAX_TK_BEFORE_BAN","TKP_LOSE_SCORE"];
if (isNil "paramsArray") then {
	if (isClass (missionConfigFile/"Params")) then {
		_conf = missionConfigFile/"Params";
		for "_i" from 0 to (count _conf - 1) do {
			_paramName = configName (_conf select _i);
			_paramval = getNumber (_conf/_paramName/"default");
			if (_paramval != -99999 && {_paramName in _names}) then {
				missionNameSpace setVariable [_paramName, _paramval];
			};
		};
	};
} else {
	for "_i" from 0 to (count paramsArray - 1) do {
		_paramval = paramsArray select _i;
		if (_paramval != -99999) then {
			_paramName = configName ((missionConfigFile/"Params") select _i);
			if (_paramName in _names) then {
				missionNameSpace setVariable [_paramName, _paramval];
			};
		};
	};
};

if (isNil "TKP_MAX_TK_BEFORE_KICK") then { TKP_MAX_TK_BEFORE_KICK = 3; };
if (isNil "TKP_MAX_TK_BEFORE_BAN") then { TKP_MAX_TK_BEFORE_BAN = 6; };
if (isNil "TKP_LOSE_SCORE") then { TKP_LOSE_SCORE = -10; };
if (isNil "TKP_USE_EXTERNAL_FILE") then { TKP_USE_EXTERNAL_FILE = 0; };

if (TKP_STOP_TEAMKILL_MSG == "") then { TKP_STOP_TEAMKILL_MSG = "STOP TEAMKILLING!"; };
if (TKP_STOP_TEAMKILL_KICK_MSG == "") then { TKP_STOP_TEAMKILL_KICK_MSG = "You should have stopped earlier, you'll get kicked!\n\nVous auriez dû arréter avant, on va vous éjecter!"; };
if (TKP_HAS_TEAMKILLED_MSG == "") then { TKP_HAS_TEAMKILLED_MSG = "Player %1 has teamkilled and will lose points!<br/>Le joueur %1 a commis un teamkill et perdra des points!"; };
if (TKP_HAS_TEAMKILLED_AND_KICKED_MSG == "") then { TKP_HAS_TEAMKILLED_AND_KICKED_MSG = "Player %1 has teamkilled and will be kicked!<br/>Le joueur %1 a commis un teamkill et sera kické!"; };
if (TKP_IS_BANNED_MSG == "") then { TKP_IS_BANNED_MSG = "Player %1 has been banned for teamkilling!<br/>Le joueur %1 a été bannis pour ses teamkills!"; };

tkp_fnc_killedEH = {
	private ["_body","_killer","_veh_body","_veh_killer","_name"];
	_body = _this select 0;
	_killer = _this select 1;
	_veh_body = vehicle _body;
	_veh_killer = vehicle _killer;
	if ((getplayerUID player) != (getplayerUID _killer) && !TKP_IGNORE && TKP_UIDS find (getplayerUID _killer) == -1) then {
		if ((side _killer == TKP_SIDE) || ((_killer getVariable ["TKP_SIDE",civilian]) == TKP_SIDE) && _veh_body != _veh_killer) then {
			TKP_PVEH = [_killer ,name _killer, (getplayerUID _killer)];
			publicVariable "TKP_PVEH";
		};
	};
};

tkp_fnc_respawnEH = {
	private ["_body","_corpse"];
	_unit = _this select 0;
	_corpse = _this select 1;
	player setVariable ["TKP_SIDE",TKP_SIDE,true];
};

tkp_fnc_pveh = {
	private ["_params","_killer","_name","_uid","_tks"];
	_params = _this select 1;
	
	_killer = _params select 0;
	_name = _params select 1;
	_uid = _params select 2;
	_tks = (SERVER getVariable [format["tkp_%1",_uid],0]) + 1;
	if (_uid == getPlayerUID(player) && !TKP_IGNORE && {(TKP_UIDS find (getplayerUID player) == -1)}) then {
		[] spawn tkp_fnc_manageTK;
	} else {
		switch(true) do {
			case (_tks < TKP_MAX_TK_BEFORE_KICK): {
				hint parseText format[TKP_HAS_TEAMKILLED_MSG,_name];
			};
			case (_tks < TKP_MAX_TK_BEFORE_BAN): {
				hint parseText format[TKP_HAS_TEAMKILLED_AND_KICKED_MSG,_name];
			};
			default {
				hint parseText format[TKP_IS_BANNED_MSG,_name];
			};
		};		
	};
	if (isServer && TKP_LOSE_SCORE < 0) then {
		_killer addScore TKP_LOSE_SCORE;
	};
};

tkp_fnc_manageTK = {
	private ["_n"];
	TKP_TKS = TKP_TKS + 1;
	SERVER setVariable [format["tkp_%1",getPlayerUID(player)],TKP_TKS,true];
	switch(true) do {
		case (TKP_TKS < TKP_MAX_TK_BEFORE_KICK): {
			titleText ["STOP TEAMKILLING!","BLACK FADED"];
			sleep 3;
			titleText ["STOP TEAMKILLING!","PLAIN"];
		};
		case (TKP_TKS < TKP_MAX_TK_BEFORE_BAN): {
			disableUserInput true;
			player setPos [0,0,0];
			_n = 0;
			while {_n < 10} do
			{
				titleText [TKP_STOP_TEAMKILL_KICK_MSG,"BLACK FADED"];
				_n = _n + 1;
				sleep 1;
			};
			disableUserInput false;
			player setDamage 1;
			endMission "LOSER";
		};
		default {
			endMission "LOSER";
		};
	};
};

if (TKP_MAX_TK_BEFORE_KICK >= TKP_MAX_TK_BEFORE_BAN) then {
	TKP_MAX_TK_BEFORE_KICK = TKP_MAX_TK_BEFORE_BAN - 1;
};

if (isServer) then {
	TKP_PVEH = [];
	publicVariable "TKP_PVEH";
	"TKP_PVEH" addPublicVariableEventHandler tkp_fnc_pveh;
	if (isNil "TKP_UIDS") then { TKP_UIDS = []; };
	publicVariable "TKP_UIDS";
};

if (!isDedicated) then {
	0 spawn {
		waitUntil {!(isNull player)};
		waitUntil {player == player};
		TKP_SIDE = playerSide;
		TKP_TKS = 0;
		if (isNil "TKP_IGNORE") then { TKP_IGNORE = false; };
		player setVariable ["TKP_SIDE",TKP_SIDE,true];
		if (!isServer) then {
			"TKP_PVEH" addPublicVariableEventHandler tkp_fnc_pveh;
		};
		if (isNil "SERVER" || { typeName SERVER != typeName objNull } || { !(SERVER isKindOf "Logic") }) then {
			0 spawn {
				while {true} do {
					hintSilent parseText "<t color='#ff0000'>Missing the Server game logic for the TK Punishement!</t>";
					sleep 1;
				};
			};
		} else {
			player addEventHandler ["Killed", tkp_fnc_killedEH];
			player addEventHandler ["Respawn", tkp_fnc_respawnEH];
			TKP_TKS = SERVER getVariable [format["tkp_%1",getPlayerUID(player)],0];
			if (TKP_TKS >= TKP_MAX_TK_BEFORE_BAN) then {
				[] spawn tkp_fnc_manageTK;
			};
		};
		sleep 3;
		// For JIP players, the side defaults to West on initialization. So we double check after a few seconds.
		if (TKP_SIDE != playerSide && TKP_SIDE == west) then {
			TKP_SIDE = playerSide;
			player setVariable ["TKP_SIDE",TKP_SIDE,true];
		};
	};
};

if (isServer) then {
	if (isNil "TKP_UIDS" || { count TKP_UIDS <= 0 }) then {
		if (TKP_USE_EXTERNAL_FILE > 0) then {
			TKP_UIDS = call compile preprocessFileLineNumbers "admin_uids.sqf";
		} else {
			TKP_UIDS = [];
		};
	};
	publicVariable "TKP_UIDS";
};