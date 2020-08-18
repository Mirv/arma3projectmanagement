class MAR
{
  tag = "MAR"
    class functions
    {
      file = "functions";
      class weaponNames { Description = "Get array of the weapon class & name from the weapon config file & if it was vehicle kill."; };  
      class getDistance { Description = "Get array of distance, target and killer 3 coord array."; };  
      class formatKillDbInsert { Description = "Format for inserting to the killLog table."; };
      class shortTestDBInsert { Description = "Seeing if params can be tweaked without breaking."; };
      class connectDB { Description = "Create a handle to Connect to ExtDB for executing queries."; };
	};

}