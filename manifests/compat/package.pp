define oracle::compat::package(
                                $version         = undef,
                                $packaganame     = $name,
                                $fullpackagename = undef,
                                $baseurl         = 'https://oss.oracle.com/projects/compat-oracle/dist/files/Enterprise_Linux',
                                $arch            = 'i686',
                                $ensure          = 'present',
                              ) {
  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  include ::oracle

  if($fullpackagename!=undef)
  {
    $real_package_name=$fullpackagename
  }
  else
  {
    $real_package_name="${packaganame}-${version}.${oracle::params::package_versiontag}.${arch}"
  }

  if($version==undef) and ($fullpackagename==undef)
  {
    fail('either version or fullpackagename must be set')
  }

  if($version==undef) and ($fullpackagename==undef)
  {
    fail('incompatible options: version / fullpackagename cannot be set at the same time')
  }

  if($ensure=='present')
  {
    exec { "oracle compat package ${packaganame} ${version} ${arch}":
      command => "rpm -Uvh ${baseurl}/${real_package_name}.rpm",
      unless  => "rpm -q ${packaganame}",
    }
  }
  else
  {
    #absent
    fail('currently unsupported')
  }
}
