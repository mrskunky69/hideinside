game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'phil'
version '1.2.0'


client_scripts {
    'config.lua',
    'client/client.lua',
	
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    'config.lua',
    'Lang.lua'
}

escrow_ignore {
    'config.lua', 
    'wrapper/*.lua'
  }

lua54 'yes'

