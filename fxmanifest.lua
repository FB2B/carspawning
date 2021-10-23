fx_version 'bodacious'
game 'gta5'

author 'Mac'
description 'A vehicle spawning menu for FiveM servers utilising html NUI.'
version '1.0.0.1'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/script.js',
    'ui/style.css'
}

client_script 'client.lua'
server_script 'server.lua'
