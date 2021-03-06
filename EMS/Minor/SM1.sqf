//Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
//Edited for EMS by Fuchs

private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,5500,2,0,2000,0] call BIS_fnc_findSafePos;

diag_log "EMS: Minor mission created (SM1)";

//Mission start
[nil,nil,rTitleText,"A bandit hunting party has been spotted! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_hummer = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer setVariable ["Sarge",1,true];

_aispawn = [_coords,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 5;
 [_coords,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 1;

waitUntil{({alive _x} count (units SniperTeam)) < 1};

//Mission completed
[nil,nil,rTitleText,"The hunting party has been wiped out!", "PLAIN",6] call RE;

MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;

[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
