#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class ELDB
	{
		// Meta information for editor
		name = "Event Logger To Database";
		author = "=JpS=Raptor-Man";
		url = "";

		// Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
		requiredVersion = 1; 
		// Required addons, used for setting load order.
		// When any of the addons is missing, pop-up warning will appear when launching the game.
		requiredAddons[] = {};
		// List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content unlocking.
		units[] = {};
		// List of weapons (CfgWeapons classes) contained in the addon.
		weapons[] = {};
	};
};

// note we 
// ...removed nesting
// ...have no fn_ at front of class name ... yet
// ... init became a fn_ in the filesystem
#include "functions\functions.hpp"

// #include "MemberList.hpp"

// class CfgFunctions
// {
//    class ASMS
//    {
// 	   class Functions
// 	   {
// 			tag = "ASMS";

// 			class init
// 			{
// 				file = "AntistasiServerMembers\fn_init.sqf";
// 				preInit = 1;
// 			};
// 			class onPlayerConnected
// 			{
// 				file = "AntistasiServerMembers\fn_onPlayerConnected.sqf";
// 			};
// 	   };
//    };  
// };