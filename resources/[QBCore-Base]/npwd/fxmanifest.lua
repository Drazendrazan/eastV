fx_version "cerulean"
game "gta5"
description 'js runtime monkaW'
authors { "itschip",  "erik-sn", "TasoOneAsia", "kidz", "RockySouthpaw"}
version '1.4.3'

client_scripts {
    'resources/dist/client/client.js',
    'resources/client/*.lua'
}

server_script {
    'build-detector.js',
    'resources/dist/server/server.js'
}

ui_page 'resources/html/index.html'

files {
    'config.json',
    'resources/html/index.html',
    'resources/html/**/*',
}

dependency {
	'screenshot-basic',
  'pma-voice'
}
