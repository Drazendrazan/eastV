fx_version 'cerulean'

game 'gta5'

server_scripts {
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/client.lua',
	'locales/en.lua'
}

ui_page('html/index.html')

files({
    'html/index.html',
    'html/sounds/pickaxe.ogg',
	'html/sounds/breakrock.ogg'
})
