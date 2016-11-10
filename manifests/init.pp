# == Class: oracle
#
# === oracle documentation
#
class oracle(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits oracle::params{

  class { '::oracle::install': } ->
  class { '::oracle::config': } ~>
  class { '::oracle::service': } ->
  Class['::oracle']

}
