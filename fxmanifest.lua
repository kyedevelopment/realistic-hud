fx_version 'cerulean'

game { 'gta5' }

lua54 'yes'

client_scripts {
	'config.lua',
	'client/*.lua'
}

server_scripts {
	'server/*.lua',
	'@mysql-async/lib/MySQL.lua'
}

ui_page 'html/ui.html'


files {
	'html/ui.html',
	'html/*.css',
	'html/*.js',
	'html/css/*.css',
	'html/js/*.js',
	'html/img/*.png',
	'html/assets/img/*.png',
	'html/assets/fonts/*.ttf',
	'html/assets/fonts/*.otf',
	'html/assets/fonts/*.woff',
	'html/assets/fonts/*.woff2',
	'html/assets/fonts/*.svg',
	'html/assets/fonts/*.eot',
	'html/assets/fonts/*.css',
	'html/assets/fonts',
	'html/img/*.png',
	'html/assets/css/*.css',
	'html/assets/assets/js/*.js',
	'html/assets/bootstrap/css/*.css',
	'html/assets/bootstrap/js/*.js',

	'html/assetsnew/img/*.png',
	'html/assetsnew/fonts/*.ttf',
	'html/assetsnew/fonts/*.otf',
	'html/assetsnew/fonts/*.woff',
	'html/assetsnew/fonts/*.woff2',
	'html/assetsnew/fonts/*.svg',
	'html/assetsnew/fonts/*.eot',
	'html/assetsnew/fonts/*.css',
	'html/assetsnew/fonts',
	'html/assetsnew/css/*.css',
	'html/assetsnew/assets/js/*.js',
	'html/assetsnew/bootstrap/css/*.css',
	'html/assetsnew/bootstrap/js/*.js',
}

dependency {
	'esx_status',
	'esx_basicneeds',
	'es_extended',
	'esx_society',
}