["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Disable automatic radio messages
enableSentences false;
enableRadio false;

call compile preprocessFile "TKP\tkp_init.sqf";
_null =[] execVM "scripts\restrictions_sniper.sqf";
_null =[] execVM "scripts\briefing.sqf";
_null =[] execVM "scripts\grenadeStop.sqf";
_null =[] execVM "scripts\playerMarkers.sqf";


//[missionnamespace,"arsenalClosed",[displaynull,uinamespace getvariable ["BIS_fnc_arsenal_toggleSpace",false]]] call bis_fnc_callscriptedeventhandler;
[missionnamespace, "arsenalClosed",
{
	// Save inventory for loading after respawn
	[player, [missionnamespace, "VirtualInventory"]] call BIS_fnc_saveInventory;
}] call BIS_fnc_addScriptedEventHandler;

// On respawn
player addEventHandler ["Respawn",
{
	private ["_player", "_body"];
	_player	= _this select 0;
	_body	= _this select 1;

	if !(_player getVariable ["BIS_revive_incapacitated", false]) then
	{
		private ["_side", "_loadoutType", "_hasVirtualArsenal"];
		_side			= side group _player;
		_loadoutType 		= _player getVariable ["BIS_hvt_loadoutType", _body getVariable ["BIS_hvt_loadoutType", "Rifleman"]];
		_hasVirtualArsenal	= count (missionnamespace getvariable ["bis_fnc_saveInventory_data", []]) > 0;

		private "_loadoutForSide";
		_loadoutForSide = if (_side == WEST) then
		{
			format["loadouts\BLUFOR_%1.sqf", _loadoutType]
		}
		else
		{
			format["loadouts\OPFOR_%1.sqf", _loadoutType]
		};

		if ([missionnamespace, "VirtualInventory"] call BIS_fnc_inventoryExists) then
		{
			[_player, [missionnamespace, "VirtualInventory"]] call bis_fnc_loadInventory;
		}
		else
		{
			_player execVM _loadoutForSide;
		};
	};
}];

// Preload Virtual arsenal
["Preload"] call BIS_fnc_arsenal;

// Set initial camera location, otherwise ammoboxes always stay in between player and camera
missionNamespace setVariable ["BIS_fnc_arsenal_campos_0", [1.52,124.49,8.72719,[0.297925,0.433566,1.16882]]];
