<?php
class loader{
    public static function lib($className){
        $lib_file = 'lib/'.$className.'.php';
      //  $main_file = 'main/'.$className.'.php';
        if(file_exists($lib_file)){
            require $lib_file;
        }
      }
}


spl_autoload_register(array("loader","lib"));
new bootstrap();
?>
