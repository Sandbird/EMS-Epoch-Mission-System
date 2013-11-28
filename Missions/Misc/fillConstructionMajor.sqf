//Created by TheSzerdi edited by MimiC
_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// CONSTRUCTION MATERIALS
_crate addWeaponCargoGlobal ["bulk_empty", 25];
_crate addWeaponCargoGlobal ["CinderBlocks", 25];
_crate addMagazineCargoGlobal ["MortarBucket", 25];
_crate addMagazineCargoGlobal ["PartPlywoodPack", 10];
_crate addMagazineCargoGlobal ["PartLumberPack", 10];
_crate addWeaponCargoGlobal ["ItemCanvas", 25];
_crate addMagazineCargoGlobal ["PartGeneric", 25];
_crate addMagazineCargoGlobal ["ItemSandbag", 15];
_crate addMagazineCargoGlobal ["ItemTankTrap", 15];
_crate addWeaponCargoGlobal ["PartWoodPile", 20];

// TOOLS
_crate addMagazineCargoGlobal ["ItemToolbox", 2];
_crate addMagazineCargoGlobal ["ItemEtool", 2];
_crate addMagazineCargoGlobal ["ItemCrowbar", 2];
_crate addMagazineCargoGlobal ["ItemKnife", 2];