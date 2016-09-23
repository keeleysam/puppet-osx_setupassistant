# Class: osx_setupassistant::profile
#
# Module to manage the macOS Setup Assistant

class osx_setupassistant (

  $identifier    = 'com.apple.SetupAssistant',
  $organization  = '',

) {

  validate_string($identifier)
  validate_string($organization)

  class{'osx_setupassistant::profile': } ->
  Class['osx_setupassistant']

}