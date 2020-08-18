/*

CREATE TABLE `killlog` (
	`killedUID` INT,
	`killedName` VARCHAR(30),
	`killedTeam` VARCHAR(30),
	`killerUID` INT NOT NULL,
	`killerName` VARCHAR(30) NOT NULL,
	`killerTeam` VARCHAR(30),
	`distance` INT NOT NULL,
    `killed_xPos` float NOT NULL,
    `killed_yPos` float NOT NULL,
    `killed_zPos` float NOT NULL,
    `killer_xPos` float NOT NULL,
    `killer_yPos` float NOT NULL,
    `killer_zPos` float NOT NULL,
	`weaponName` VARCHAR(50),
	`weaponClass` VARCHAR(50),
    `isVehicle` BOOLEAN,
    `vehicleName` VARCHAR(50),
    `gameTime` int
);

version 2

CREATE TABLE `killlog` 
  ( 
     `killeduid`   INT, 
     `killedname`  VARCHAR(30), 
     `killedteam`  VARCHAR(30), 
     `killeruid`   INT NOT NULL, 
     `killername`  VARCHAR(30) NOT NULL, 
     `killerteam`  VARCHAR(30), 
     `killdistance` INT NOT NULL, 
     `killed_xpos` FLOAT NOT NULL, 
     `killed_ypos` FLOAT NOT NULL, 
     `killed_zpos` FLOAT NOT NULL, 
     `killer_xpos` FLOAT NOT NULL, 
     `killer_ypos` FLOAT NOT NULL, 
     `killer_zpos` FLOAT NOT NULL, 
     `weaponname`  VARCHAR(50), 
     `weaponclass` VARCHAR(50), 
     `isvehicle`   BOOLEAN, 
     `vehiclename` VARCHAR(50), 
     `gametime`    INT, 
     `timestamp`   DATETIME DEFAULT CURRENT_TIMESTAMP 
  ); 
  

  // long form for inserts: killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, distance, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, weaponName, weaponClass, isVehicle, vehicleName, gameTime
*/