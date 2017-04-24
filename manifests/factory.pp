class filebeat::factory (
  $prospectors                 = {}
){
  
  validate_hash($prospectors)
  if($prospectors){
    create_resources('filebeat::prospector', $prospectors)
  }

}
