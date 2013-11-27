DayZ-Mission-System--Epoch-Edition-
===================================

[WIP for EPOCH] Merged Mission System from TheSzerdi and Lazyink 

[Install Tutorial]

go to
server_functions.sqf

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
