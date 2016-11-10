define oracle::compat::package(
                                $version,
                                $packaganame = $name,
                                $baseurl     = 'https://oss.oracle.com/projects/compat-oracle/dist/files/Enterprise_Linux',
                                $arch        = 'i686',
                              ) {
  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  include ::oracle

  exec { "oracle compat package ${packaganame} ${version} ${arch}":
    command => "rpm -Uvh ${baseurl}/${packaganame}-${version}.${oracle::params::package_versiontag}.${arch}.rpm",
    unless  => "rpm -q  ${packaganame}",
  }
}
