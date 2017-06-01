# Class: tomcat::params
#
# This class manages Tomcat parameters.
#
# Parameters:
# - $catalina_home is the root of the Tomcat installation.
# - The $user Tomcat runs as.
# - The $group Tomcat runs as.
# - The $dir_list of sub-directories to manage under $catalina_base
# - The $dir_mode to use for sub-directories under $catalina_base
# - The $copy_from_home_mode to use for initial files copied from $catalina_home.
class tomcat::params {
  $catalina_home       = '/opt/apache-tomcat'
  $user                = 'tomcat'
  $group               = 'tomcat'
  $dir_list            = [
    'bin',
    'conf',
    'lib',
    'logs',
    'temp',
    'webapps',
    'work',
  ]
  $dir_mode            = '2770'
  $copy_from_home_mode = '0660'
}
