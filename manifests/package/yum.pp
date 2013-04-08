# Class: owncloud::package::yum
#
# This the main class for yum repositories
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
class owncloud::package::yum inherits owncloud::params {
  file {
    "/etc/pki/rpm-gpg/RPM-GPG-KEY-owncloud":
      owner => root, group => root, mode => 0600,
      source => "puppet:///modules/owncloud/yum/RPM-GPG-KEY-owncloud";
  }

  Yumrepo {
    mirrorlist => absent, enabled => 0, gpgcheck => 1,
    priority => 20, failovermethod => priority,
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-owncloud",
    require => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-owncloud"]
  }

  yumrepo {
    "isv_ownCloud_community":
      descr => 'Latest stable community release of ownCloud (RedHat_RHEL-6)',
      baseurl => 'http://download.opensuse.org/repositories/isv:/ownCloud:/community/RedHat_RHEL-6/',
      enabled => 1;
  }
}
