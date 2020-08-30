/*
CREATE TABLE `killlog` (
  `killeduid` bigint DEFAULT NULL,
  `killedname` varchar(30) DEFAULT NULL,
  `killedteam` varchar(30) DEFAULT NULL,
  `killeruid` bigint NOT NULL,
  `killername` varchar(30) NOT NULL,
  `killerteam` varchar(30) DEFAULT NULL,
  `map` varchar(30) DEFAULT NULL,
  `mission` varchar(50) DEFAULT NULL,
  `serverName` varchar(300) DEFAULT NULL,
  `killed_xpos` float NOT NULL,
  `killed_ypos` float NOT NULL,
  `killed_zpos` float NOT NULL,
  `killer_xpos` float NOT NULL,
  `killer_ypos` float NOT NULL,
  `killer_zpos` float NOT NULL,
  `killdistance` int NOT NULL,
  `weaponclass` varchar(50) DEFAULT NULL,
  `weaponname` varchar(50) DEFAULT NULL,
  `isvehicle` tinyint(1) DEFAULT NULL,
  `vehicleclass` varchar(50) DEFAULT NULL,
  `vehiclename` varchar(50) DEFAULT NULL,
  `gametime` int DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
);

// INSERT INTO killlog ( killedUID, killedName, killedTeam, killerUID, killerName, killerTeam, map, mission, servername, killed_xpos, killed_yPos, killed_zPos, killer_xPos, killer_yPos, killer_zPos, killDistance, weaponName, weaponClass, isVehicle, vehicleClass, vehicleName, gameTime ) VALUES ( 76561198010027779, '=JpS=Raptor-Man', 'WEST', 76561198010027779, '=JpS=Raptor-Man', 'WEST', 'VR', '__cur_mp', 'Test Server', 1836.53, 5478.16, 2.46749, 1836.53, 5478.16, 2.46749, 0, 'MXM 6.5 mm', 'arifle_MXM_Hamr_LP_BI_F', false, 'None', 'None', 4455.34 );
*/