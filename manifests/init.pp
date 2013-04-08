# Class: owncloud
#
# This module manages OwnCloud
#
# Parameters:
#  database = specify the OwnCloud database (internal, mysql)
#  packageCore = name of the OwnCloud core package
#  packageExtra = name of the OwnCloud third party package
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#  include owncloud{ database='mysql' }
#
class owncloud (
  $database     = hiera('owncloud::database', $owncloud::params::database),
  $packageCore  = hiera('owncloud::packageCore', $owncloud::params::packageCore),
  $packageExtra = hiera('owncloud::packageExtra', $owncloud::params::packageExtra))
inherits owncloud::params {
  # Include Puppetlabs standard library
  include stdlib
  
  # Start workflow
  anchor { 'owncloud::clientStart': } ->
  class { 'owncloud::package::yum': } ~> class { 'owncloud::package' : } ~>
  class { 'owncloud::config': } ~> class { 'owncloud::service': } ~>
  anchor { 'owncloud::clientEnd': }
}
