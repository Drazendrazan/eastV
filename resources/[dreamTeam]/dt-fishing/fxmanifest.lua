fx_version 'cerulean'
game 'gta5'

description 'dt-fishing'
version '1.0.0'

shared_scripts { 
	'config.lua',
}

client_scripts {
	'client/functions.lua',
	'client/main.lua'
}

server_script 'server/main.lua'