<?php
class bootstrap{
  public function __construct(){
    if(isset($_GET["url"])){
        $url = explode('/',$_GET["url"]);
        $class_name = !empty($url[0])?$url[0]:'index';
        $file = 'main/'.$class_name.'.php';
        if(!file_exists($file)){
          error::dieError('no_file',$class_name.' is not found');
          return;
        }
        require $file;
        $obj = new $class_name();
        $function_name = !empty($url[1])?$url[1]:'initial';
        if(method_exists($obj,$function_name)){
            echo $obj->{$function_name}();
        }
        else{
            error::dieError('no_method',$function_name.' is not found in '.$class_name);
        }
    }
  }
}
?>
