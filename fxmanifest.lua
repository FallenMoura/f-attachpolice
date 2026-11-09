fx_version 'cerulean'
game 'gta5'


client_scripts {
   '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
   'client/client.lua',
   'client/target.lua',
   'config.lua',
}

server_scripts {
   'server/server.lua',
   'config.lua'
}

ui_page "html/index.html"
files {
    "html/script.js",
    "html/index.html"
}

