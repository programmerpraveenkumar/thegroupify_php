<?php
class loader{
    public static function lib($className){
        $lib_file='lib/'.$className.'.php';
        $main_file='main/'.$className.'.php';        
        if(file_exists($lib_file)){
            require $lib_file;
        }
        elseif(file_exists($main_file)){
            require $main_file;
        }
        else{
            echo "$file";
            die(' is not found');
        }
        
    }
}


spl_autoload_register(array("loader","lib"));
if(isset($_GET["url"])){
    $url=$_GET["url"];     
    $load=new load();    
    if(method_exists($load,$url)){
        echo $load->$url();
    }
    else{
        echo 'We will fix the problem soon';
    }
}
?>