class oracle::service inherits oracle {

  #
  validate_bool($oracle::manage_docker_service)
  validate_bool($oracle::manage_service)
  validate_bool($oracle::service_enable)

  validate_re($oracle::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${oracle::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $oracle::manage_docker_service)
  {
    if($oracle::manage_service)
    {
      #service or exec here
    }
  }
}
