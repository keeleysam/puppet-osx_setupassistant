# yay
class osx_setupassistant::profile{

$disablesetupassistant = $osx_setupassistant::disablesetupassistant
$identifier            = $osx_setupassistant::identifier
$organization          = $osx_setupassistant::organization

mac_profiles_handler::manage { 'com.apple.SetupAssistant':
	ensure  => $disablesetupassistant,
	file_source => template('osx_setupassistant/com.apple.SetupAssistant.mobileconfig.erb'),
	type => 'template',
}

}
