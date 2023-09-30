game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'phil'
version '1.2.0'


client_scripts {
    'config.lua',
    'wrapper/cl_wrapper.lua',
    'client/client.lua',
	'client/deleteme.lua',
}

server_scripts {
    'wrapper/sv_wrapper.lua',
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

