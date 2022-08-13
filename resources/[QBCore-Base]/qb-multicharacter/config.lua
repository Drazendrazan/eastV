Config = {}
Config.StartingApartment = false -- Enable/disable starting apartments (make sure to set default spawn coords)
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-202.92, -1002.88, 29.14) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(304.99, -1469.98, 46.51, 317.63) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(311.63803, -1460.509, 46.509487, 132.23925) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(307.86514, -1468.126, 46.509475, 138.3394) -- Camera coordinates for character preview screen

Config.DefaultNumberOfCharacters = 1 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:0914ab671d4452856c454f3e70c58c6cb585f1cd", numberOfChars = 1 },
}