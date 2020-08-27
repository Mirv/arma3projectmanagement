/*
CREATE TABLE `killlog` 
  ( 
     `killeduid`   INT, 
     `killedname`  VARCHAR(30), 
     `killedteam`  VARCHAR(30), 
     `killeruid`   INT NOT NULL, 
     `killername`  VARCHAR(30) NOT NULL, 
     `killerteam`  VARCHAR(30), 
     `map`  VARCHAR(30),
     `mission`  VARCHAR(50),
     `serverName`  VARCHAR(300),
     `killed_xpos` FLOAT NOT NULL, 
     `killed_ypos` FLOAT NOT NULL, 
     `killed_zpos` FLOAT NOT NULL, 
     `killer_xpos` FLOAT NOT NULL, 
     `killer_ypos` FLOAT NOT NULL, 
     `killer_zpos` FLOAT NOT NULL, 
     `killdistance` INT NOT NULL, 
     `weaponclass` VARCHAR(50), 
     `weaponname`  VARCHAR(50), 
     `isvehicle`   BOOLEAN, 
     `vehicleclass`VARCHAR(50),  
     `vehiclename` VARCHAR(50),
     `gametime`    INT, 
     `timestamp`   DATETIME DEFAULT CURRENT_TIMESTAMP 
  ); 

INSERT INTO killlog (killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime) VALUES (1, 'Raptor', 'GUER', 2, 'M', 'T', 'l', 'l', 'l', 1, 1, 1, 1, 1, 1, 1, 'WName', 'WClass', true, 'VName', 'VClass', 1);

*/



/*
// TODO - add indexing back

CREATE TABLE `killlog` 
  ( 
     `killeduid`   INT, 
     `killedname`  VARCHAR(30), 
     `killedteam`  VARCHAR(30), 
     `killeruid`   INT NOT NULL, 
     `killername`  VARCHAR(30) NOT NULL, 
     `killerteam`  VARCHAR(30), 
     `killed_xpos` FLOAT NOT NULL, 
     `killed_ypos` FLOAT NOT NULL, 
     `killed_zpos` FLOAT NOT NULL, 
     `killer_xpos` FLOAT NOT NULL, 
     `killer_ypos` FLOAT NOT NULL, 
     `killer_zpos` FLOAT NOT NULL, 
     `killdistance` INT NOT NULL, 
     `weaponclass` VARCHAR(50), 
     `weaponname`  VARCHAR(50), 
     `isvehicle`   BOOLEAN, 
     `vehicleclass`VARCHAR(50),  
     `vehiclename` VARCHAR(50),
     `gametime`    INT, 
     `timestamp`   DATETIME DEFAULT CURRENT_TIMESTAMP 
  ); 
  
  // long form for inserts: killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killdistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime
*/

