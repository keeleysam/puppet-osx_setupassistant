# Class: osx_setupassistant::profile
#
#

class osx_setupassistant::profile{

$identifier            = $osx_setupassistant::identifier
$organization          = $osx_setupassistant::organization

$profile = {
    'PayloadContent' => [
      {
        'PayloadContent' => {
          'com.apple.SetupAssistant' => {
            'Forced' => [
              {
                'mcx_preference_settings' => {
                  'DidSeeiCloudLoginForStorageServices' => true,
                  'DidSeeCloudSetup' => true,
                  'LastSeenCloudProductVersion' => $::os['macosx']['version']['full'],
                  'LastSeenBuddyBuildVersion' => $::os['macosx']['build'],
                  'RunNonInteractive' => true
                }
              }
            ]
          }
        },
        'PayloadEnabled' => true,
        'PayloadIdentifier' => $identifier,
        'PayloadType' => 'com.apple.ManagedClient.preferences',
        'PayloadUUID' => 'C823FDE7-0EFB-485A-B9EB-35069450556D',
        'PayloadVersion' => 1
      }
    ],
    'PayloadDescription' => "Included custom settings:\ncom.apple.SetupAssistant",
    'PayloadDisplayName' => 'Settings for Setup Assistant',
    'PayloadIdentifier' => $identifier,
    'PayloadOrganization' => $organization,
    'PayloadRemovalDisallowed' => true,
    'PayloadScope' => 'System',
    'PayloadType' => 'Configuration',
    'PayloadUUID' => 'D06A8CF8-4C1C-452B-A48D-97871AF5ECEF',
    'PayloadVersion' => 1
  }

  mac_profiles_handler::manage { 'com.apple.SetupAssistant':
    ensure      => present,
    file_source => plist($profile),
    type        => 'template',
  }

}
