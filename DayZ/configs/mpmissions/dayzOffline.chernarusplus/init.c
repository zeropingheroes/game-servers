void main()
{
	//INIT ECONOMY--------------------------------------
	Hive ce = CreateHive();
	if ( ce )
		ce.InitOffline();

	//DATE RESET AFTER ECONOMY INIT-------------------------
	int year, month, day, hour, minute;
	int reset_month = 9, reset_day = 20;
	GetGame().GetWorld().GetDate(year, month, day, hour, minute);

	if ((month == reset_month) && (day < reset_day))
	{
		GetGame().GetWorld().SetDate(year, reset_month, reset_day, hour, minute);
	}
	else
	{
		if ((month == reset_month + 1) && (day > reset_day))
		{
			GetGame().GetWorld().SetDate(year, reset_month, reset_day, hour, minute);
		}
		else
		{
			if ((month < reset_month) || (month > reset_month + 1))
			{
				GetGame().GetWorld().SetDate(year, reset_month, reset_day, hour, minute);
			}
		}
	}
}

class CustomMission: MissionServer
{
	void SetRandomHealth(EntityAI itemEnt)
	{
		if ( itemEnt )
		{
			float rndHlt = Math.RandomFloat( 0.45, 0.65 );
			itemEnt.SetHealth01( "", "", rndHlt );
		}
	}

	override PlayerBase CreateCharacter(PlayerIdentity identity, vector pos, ParamsReadContext ctx, string characterName)
	{
		Entity playerEnt;
		playerEnt = GetGame().CreatePlayer( identity, characterName, pos, 0, "NONE" );
		Class.CastTo( m_player, playerEnt );

		GetGame().SelectPlayer( identity, m_player );

		return m_player;
	}

	override void StartingEquipSetup(PlayerBase player, bool clothesChosen)
	{
		EntityAI itemClothing;
		EntityAI itemEnt;
		ItemBase itemBs;
		float rand;

                // --- SET PLAYER'S INITIAL HEALTH, ENERGY, AND WATER ---
                // Set player's health to 100 (full health).
                // For players, SetHealth expects a value between 0 and 100.
                player.SetHealth("", "", 100.0);

                // Set player's energy and water to their maximum values.
                // As of DayZ 1.25, max energy/water is often around 5000.
                // Adjust these values if your server's DayZ version has different maximums.
                //player.SetEnergy(5000);
                //player.SetWater(5000);

		player.GetStatEnergy().Set(5000);
		player.GetStatWater().Set(5000);


		itemClothing = player.FindAttachmentBySlotName( "Body" );
		if ( itemClothing )
		{
			SetRandomHealth( itemClothing );
			
			itemEnt = itemClothing.GetInventory().CreateInInventory( "BandageDressing" );
			player.SetQuickBarEntityShortcut(itemEnt, 2);
			
			string chemlightArray[] = { "Chemlight_White", "Chemlight_Yellow", "Chemlight_Green", "Chemlight_Red" };
			int rndIndex = Math.RandomInt( 0, 4 );
			itemEnt = itemClothing.GetInventory().CreateInInventory( chemlightArray[rndIndex] );
			SetRandomHealth( itemEnt );
			player.SetQuickBarEntityShortcut(itemEnt, 1);

			rand = Math.RandomFloatInclusive( 0.0, 1.0 );
			if ( rand < 0.35 )
				itemEnt = player.GetInventory().CreateInInventory( "Apple" );
			else if ( rand > 0.65 )
				itemEnt = player.GetInventory().CreateInInventory( "Pear" );
			else
				itemEnt = player.GetInventory().CreateInInventory( "Plum" );
			player.SetQuickBarEntityShortcut(itemEnt, 3);
			SetRandomHealth( itemEnt );
		}
		
		itemClothing = player.FindAttachmentBySlotName( "Legs" );
		if ( itemClothing )
			SetRandomHealth( itemClothing );
		
		itemClothing = player.FindAttachmentBySlotName( "Feet" );
	}
};

Mission CreateCustomMission(string path)
{
	return new CustomMission();
}
