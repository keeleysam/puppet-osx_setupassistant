# puppet-osx_setupassistant
An example of dynamically generate mobileconfigs.

This is intended to bypass the macOS Setup Assistant in cases where you are precreating users, so that the user can just login without tripping on the Setup Assitant prompts.  It (intentionally) does not block users from setting up iCloud, Apple Pay, or other services later in System Preferences, but instead just allows them (or an automated bot user) to get to work faster.

This module depends on https://github.com/keeleysam/puppet-mac_profiles_handler
