fx_version "cerulean"
game "gta5"
version "1.0"
author "dreamTeam Works"

client_scripts {
    "config.lua",
    "client/functions.lua",
    "client/client.lua"
} 
server_script {
    '@oxmysql/lib/MySQL.lua',
    "config.lua",
    "server/server.lua"
}

files {
    "ui/*",
}

ui_page {"ui/index.html"}