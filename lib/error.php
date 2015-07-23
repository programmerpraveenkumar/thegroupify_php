<?php
class error{
  public static function developerError($error_type,$message){
    $error_messages = array(
      "no_file"=>"file is not found",
      "no_method"=>"method is not found"
    );
    echo json_encode(array('error'=>$error_messages[$error_type]));
  }
  public static function dieError($error_type,$message){
    self::developerError($error_type,$message);
    die();
  }
}
?>
