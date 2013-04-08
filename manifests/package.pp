# Class: owncloud::package
#
# This module contain the package configuration for OwnCloud
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class owncloud::package {
    package { '$owncloud::packageCore': ensure => installed; }
    package { '$owncloud::packageExtra': ensure => installed; }
}