# Class: osx_setupassistant::profile
#
#

class osx_setupassistant::profile{

  $identifier          = $osx_setupassistant::identifier
  $organization        = $osx_setupassistant::organization
  $skip_siri           = $osx_setupassistant::skip_siri
  $submit_diag_info    = $osx_setupassistant::submit_diag_info
  $skip_touch_id       = $osx_setupassistant::skip_touch_id
  $skip_apple_pay      = $osx_setupassistant::skip_apple_pay
  $skip_privacy        = $osx_setupassistant::skip_privacy
  $skip_icloud_storage = $osx_setupassistant::skip_icloud_storage

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
                  'RunNonInteractive' => true,
                  'DidSeeSiriSetup' => $skip_siri,
                  'DidSeeAppearanceSetup' => true,
                  'DidSeeApplePaySetup' => $skip_apple_pay,
                  'DidSeeAvatarSetup' => true,
                  'DidSeeCloudDiagnostics' => true,
                  'DidSeeTouchIDSetup' => $skip_touch_id,
                  'DidSeeSyncSetup' => true,
                  'DidSeeSyncSetup2' => true,
                  'DidSeeTrueTonePrivacy' => true,
                  'DidSeePrivacy' => $skip_privacy,
                  'SkipiCloudStorageSetup' => $skip_icloud_storage
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
      },
      {
        'PayloadContent' => {
          'com.apple.SetupAssistant.managed' => {
            'Forced' => [
              {
                'mcx_preference_settings' => {
                  'SkipCloudSetup' => true,
                }
              }
            ]
          }
        },
        'PayloadEnabled' => true,
        'PayloadIdentifier' => 'com.apple.SetupAssistant.managed',
        'PayloadType' => 'com.apple.ManagedClient.preferences',
        'PayloadUUID' => '77CC9C72-8C78-4C54-B30A-31E2EA338EC5',
        'PayloadVersion' => 1
      },
      {
        'PayloadEnabled' => true,
        'PayloadIdentifier' => 'com.apple.SubmitDiagInfo',
        'PayloadType' => 'com.apple.SubmitDiagInfo',
        'PayloadUUID' => '09183D1A-E012-46C0-8DAC-402257219896',
        'PayloadVersion' => 1,
        'PayloadDisplayName' => 'Security & Privacy',
        'AutoSubmit' => $submit_diag_info
      },
      {
        'PayloadEnabled' => true,
        'PayloadIdentifier' => 'com.apple.applicationaccess',
        'PayloadType' => 'com.apple.applicationaccess',
        'PayloadUUID' => 'F3181FA1-9CFD-40DE-8B00-9C0C7F50AD20',
        'PayloadVersion' => 1,
        'PayloadDisplayName' => 'Security & Privacy',
        'AutoSubmit' => $submit_diag_info
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
