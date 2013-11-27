DayZ-Mission-System-Epoch-Edition-
===================================

Credits : Lazyink, TheSzerdi, Falcyn , TAW_Tonic, EPOCH DEV's


[WIP for EPOCH] Merged Mission System from TheSzerdi and Lazyink 

[Install Tutorial]

go to

[server_functions.sqf]

//Put the below code in


//----------InitMissions--------//Mission System
MissionGo = 0;
MissionGoMinor = 0;
if (isServer) then { 
SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13"];
[] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf"; //Starts major mission system
SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13"];
[] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf"; //Starts minor mission system
};
//---------EndInitMissions------//


//after this into server_functions.sqf

    dayz_recordLogin = {
	private ["_key"];
	_key = format["CHILD:103:%1:%2:%3:", _this select 0, _this select 1, _this select 2];
	_key call server_hiveWrite;
};

########################################################################################################################
after this go to

[server_cleanup.fsm]

" if(vehicle _x != _x && !(vehicle _x in _safety) && (isPlayer _x) && (typeOf vehicle _x) != ""ParachuteWest"" && (vehicle _x getVariable [""Sarge"",0] != 1) && (vehicle _x getVariable [""DZAI"",0] != 1) && (vehicle _x getVariable [""Mission"",0] != 1) && !((typeOf vehicle _x) in DZE_safeVehicle)) then {" \n

or use this one if u have problems vehilces disappearing ...

" if(vehicle _x != _x && !(vehicle _x in _safety) && (isPlayer _x) && (vehicle _x getVariable [""Sarge"",0] != 1) && !((typeOf vehicle _x) in DZE_safeVehicle)) then {" \n
