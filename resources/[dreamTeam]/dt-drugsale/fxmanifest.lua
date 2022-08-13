fx_version 'cerulean'
game 'gta5'

author 'Hayalet#7141'
description 'Drug sales with npc'
version '2.0.7'

shared_scripts {
    'config.lua',
}

server_scripts {    
    'server/server.lua',
}

client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',   
    'client/client.lua'
}

dependencies {
    'qb-core',
    'PolyZone',
    'qb-target'    
}

lua54 'yes'