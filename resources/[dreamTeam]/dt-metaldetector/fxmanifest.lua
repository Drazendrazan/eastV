fx_version 'cerulean'
game 'gta5'

author 'Hayalet#7141'
version '1.0'

file 'gen_w_am_metaldetector.ytyp'

client_scripts {
    'client/**.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua'
}

server_script 'server/sv_main.lua'
shared_script 'config.lua'
