# == Class: oracle
#
# === oracle::install documentation
#
class oracle::install inherits oracle {

  if($oracle::manage_package)
  {
    # package here, for example: 
    #package { $oracle::params::package_name:
    #  ensure => $oracle::package_ensure,
    #}
  }

}
