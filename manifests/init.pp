# Class: osx_setupassistant::profile
#
# Module to manage the macOS Setup Assistant

class osx_setupassistant (

  $identifier          = 'com.apple.SetupAssistant',
  $organization        = '',
  $skip_icloud         = true,
  $skip_siri           = true,
  $submit_diag_info    = true,
  $skip_touch_id       = true,
  $skip_apple_pay      = true,
  $skip_privacy        = true,
  $skip_icloud_storage = true,

) {

  validate_string($identifier)
  validate_string($organization)
  validate_bool($skip_icloud)
  validate_bool($skip_siri)

  class {'osx_setupassistant::profile': }
  -> Class['osx_setupassistant']

}
