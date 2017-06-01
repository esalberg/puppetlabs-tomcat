# == Class: tomcat
#
# Class to manage installation and configuration of Tomcat.
#
# === Parameters
#
# [*catalina_home*]
#   The base directory for the Tomcat installation. Default: /opt/apache-tomcat
#
# [*user*]
#   The user to run Tomcat as. Default: tomcat
#
# [*group*]
#   The group to run Tomcat as. Default: tomcat
#
# [*manage_user*]
#   Boolean specifying whether or not to manage the user. Defaults to true.
#
# [*purge_connectors*]
#   Boolean specifying whether to purge all Connector elements from server.xml. Defaults to false.
#
# [*purge_realms*]
#   Boolean specifying whether to purge all Realm elements from server.xml. Defaults to false.
#
# [*manage_group*]
#   Boolean specifying whether or not to manage the group. Defaults to true.
#
# [*manage_properties*]
#   Boolean specifying whether or not to manage the catalina.properties file. Defaults to true.
#
# [*manage_dirs*]
#   Boolean specifying whether or not to manage sub-directories under $catalina_base.
#   Defaults to true.
#
# [*dir_list*]
#   Array of sub-directories to manage under $catalina_base.
#   Defaults to tomcat::params::dir_list.
#
# [*dir_mode*]
#   Mode to use for managed sub-directories under $catalina_base. Defaults to '2770'.
#
# [*copy_from_home*]
#   Boolean specifying whether or not to copy the initial config files from $catalina_home to $catalina_base. Defaults to true.
#
# [*copy_from_home_mode*]
#   The mode to use when copying the initial files from $catalina_home to $catalina_base.  Defaults to '0660'.
class tomcat (
  $catalina_home       = $::tomcat::params::catalina_home,
  $user                = $::tomcat::params::user,
  $group               = $::tomcat::params::group,
  $install_from_source = undef,
  $purge_connectors    = false,
  $purge_realms        = false,
  $manage_user         = true,
  $manage_group        = true,
  $manage_home         = true,
  $manage_base         = true,
  $manage_properties   = true,
  $manage_dirs         = true,
  $dir_list            = $::tomcat::params::dir_list,
  $dir_mode            = $::tomcat::params::dir_mode,
  $copy_from_home      = true,
  $copy_from_home_mode = $::tomcat::params::copy_from_home_mode,
) inherits ::tomcat::params {
  validate_bool($purge_connectors)
  validate_bool($purge_realms)
  validate_bool($manage_user)
  validate_bool($manage_group)
  validate_bool($manage_home)
  validate_bool($manage_base)
  validate_bool($manage_properties)
  validate_bool($manage_dirs)
  validate_array($dir_list)
  validate_string($dir_mode)
  validate_bool($copy_from_home)
  validate_string($copy_from_home_mode)

  case $::osfamily {
    'windows','Solaris','Darwin': {
      fail("Unsupported osfamily: ${::osfamily}")
    }
    default: { }
  }
}
