## Epoch Mission System
### Version 0.2.1 WIP

_Credits: Lazyink, TheSzerdi, Falcyn , TAWTonic, EPOCH DEV's<br>
[WIP for EPOCH] Merged Mission System from TheSzerdi and Lazyink_

Modified and released by TheFuchs & MimiC with permission from Lazyink & TheSzerdi.

**Requirements:**

* Notepad++
* PBO Manager
* SargeAI 1.5.2+ (Already on your server)

**Difficulty**

Easy : 10-15 minutes

* Some knowledge of Epoch Server & Mission file locations
* How to use PBO manager to unpack and pack PBO files

===========================================================================

## Installation Instructions

1. Download and unpack the most recent release of EMS from <a href="https://github.com/TheFuchs/Epoch-Mission-System--EMS-/releases">our GitHub Release Section</a>. Currently this is version 0.2.1
2. Make a copy of your *dayz_server.pbo* and rename it *dayz_server.pbo.bak*
3. Unpack your *dayz_server.pbo* to a folder called *dayz_server*
4. Copy the *Missions* folder from the EMS download and paste it into the root of your unpacked *dayz_server*


Edit your *server_functions.sqf*<br>Located: dayz_server\init\server_functions.sqf<br>

<b>Around line 540 look for this:</b>
	

    dayz_recordLogin = {
      private["_key"];
      _key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
      _key call server_hiveWrite;
    };


<b>Insert this after it:</b>
	

    //----------InitMissions--------//
    MissionGo = 0;
    MissionGoMinor = 0;
    if (isServer) then { 
      SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6"];
      [] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf"; //Starts major mission system
      SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6"];
      [] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf"; //Starts minor mission system
    };
    //---------EndInitMissions------//

	
6. Edit <b>server_updateObject.sqf</b><br>Located: dayz_server\compile\server_updateObject.sqf

<b>Around line 22 look for this:</b>

    { 
      diag_log(format["Non-string Object: ID %1 UID %2", _objectID, _uid]);
      //force fail
      _objectID = "0";
      _uid = "0";
    };

<b>Insert this after it:</b>

    if (_object getVariable "Mission" == 1) exitWith {};

7. Edit <b>server_cleanup.fsm</b><br>Located: dayz_server\system\server_cleanup.fsm

<b>Around line 298 look for this:</b>

    if(vehicle _x != _x && (vehicle _x getVariable [""Sarge"",0] != 1) && !(vehicle _x in _safety) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {" \n

<b>Replace with this:</b>

    if(vehicle _x != _x && (vehicle _x getVariable [""Mission"",0] != 1) && (vehicle _x getVariable [""Sarge"",0] != 1) && !(vehicle _x in _safety) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {" \n

<b>Repack your dayz_server.pbo</b>

