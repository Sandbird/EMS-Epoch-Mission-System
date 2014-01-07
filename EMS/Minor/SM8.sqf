//Landing party sidemission Created by TheSzerdi Edited by Falcyn [QF]
//Edited by Fuchs

private ["_coords","_wait","_dummymarker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

diag_log "EMS: Minor mission created (SM8)";

//Mission start
[nil,nil,rTitleText,"A landing party is establishing a beachhead!", "PLAIN",6] call RE;

_coords = [getMarkerPos "center",0,5000,50,0,20,0] call BIS_fnc_findSafePos;

MCoords = _coords select 1;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

pbxride = createVehicle ["PBX",_coords select 0,[], 0, "NONE"];
pbxride setVariable ["Sarge",1,true];
pbxride setFuel 1;

[_coords select 0,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 3;
LandingParty addVehicle pbxride;
LandingParty move (_coords select 1);
waitUntil{(pbxride distance (_coords select 1)) < 50}; 

tentloot = createVehicle ["TentStorage",_coords select 1,[], 0, "NONE"];
tentloot setVariable ["permaLoot",true];
sleep 1;

tentloot addWeaponCargoGlobal ["ItemCompass", 2];
tentloot addWeaponCargoGlobal ["ItemGPS", 3];
tentloot addWeaponCargoGlobal ["NVGoggles", 1];
tentloot addMagazineCargoGlobal ["FoodCanBakedBeans", 4];
tentloot addMagazineCargoGlobal ["ItemBandage", 4];
tentloot addMagazineCargoGlobal ["ItemMorphine", 4];
tentloot addMagazineCargoGlobal ["ItemPainkiller", 4];
tentloot addMagazineCargoGlobal ["ItemAntibiotic", 2];
tentloot addWeaponCargoGlobal ["ItemKnife", 2];
tentloot addWeaponCargoGlobal ["ItemToolbox", 2];
tentloot addWeaponCargoGlobal ["ItemMatchbox_DZE", 2];
tentloot addMagazineCargoGlobal ["ItemBloodbag", 2];
tentloot addMagazineCargoGlobal ["ItemJerryCan", 2];
tentloot addWeaponCargoGlobal ["MP5A5", 2];
tentloot addMagazineCargoGlobal ["30Rnd_9x19_MP5", 5];
tentloot addWeaponCargoGlobal ["glock17_EP1", 2];
tentloot addMagazineCargoGlobal ["17Rnd_9x19_glock17", 4];

waitUntil{{isPlayer _x && _x distance tentloot < 30  } count playableunits > 0}; 

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

//Mission accomplished
[nil,nil,rTitleText,"You've secured the beachhead! Good work.", "PLAIN",6] call RE;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
