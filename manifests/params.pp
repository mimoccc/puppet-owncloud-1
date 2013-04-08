# Class: owncloud::params
#
# This module contain the parameters for OwnCloud
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include owncloud::params
#
class owncloud::params {
  # OwnCloud definitions
  $database     = 'internal'
  $packageCore  = 'owncloud'
  $packageExtra = 'owncloud-3rdparty'
}