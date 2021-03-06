//Bandit Heli Down! by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
//Edited for EMS by Fuchs

private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords =  [getMarkerPos "center",0,5000,10,0,1000,0] call BIS_fnc_findSafePos;

diag_log "EMS: Minor mission created (SM4)";

//Mission start
[nil,nil,rTitleText,"A bandit helicopter has crashed! Check your map for the location!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_chopcrash = createVehicle ["UH60Wreck_DZ",_coords,[], 0, "CAN_COLLIDE"];
_chopcrash setVariable ["Sarge",1,true];

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

_aispawn = [_coords,40,4,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 1;
_aispawn = [_coords,40,4,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 1;

waitUntil{{isPlayer _x && _x distance _chopcrash < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,"Wrecked Chopper has been secured by survivors!", "PLAIN",6] call RE;

MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 5;

[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
