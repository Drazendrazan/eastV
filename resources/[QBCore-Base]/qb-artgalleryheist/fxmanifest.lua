fx_version 'cerulean'

game 'gta5'
lua54 'yes'

dependencies {
    'mka-lasers',
  } 

author 'Lionh34rt#4305'
description 'Vinewood Art Gallery heist for QBCore'
version '2.0'

ui_page 'html/index.html'

client_scripts {
    '@mka-lasers/client/client.lua',
    'client/cl_*.lua',
}

shared_script {
    'shared/sh_*.lua',
}

server_scripts {
    'server/sv_*.lua',
}

files {
    'html/*'
}