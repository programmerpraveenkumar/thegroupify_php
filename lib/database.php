<?php
class database{
    protected $_mysql;
    public  function __construct() {
        $this->_mysql = new mysqli('localhost',"root","",'messenger');
    }
    protected function storedProcedure($qury){
        //echo $qury;die('');
        return $this->_mysql->query('call '.$qury);
    }
    protected function oneFetchProcedure($qury){
        $get = $this->storedProcedure($qury);
        return $get->fetch_object();
    }
    public function DB_refreshData(){
        $tmp = '';
     foreach($_POST as $obj =>$val){
         $tmp = trim($val);
         $tmp = addslashes($tmp);
         $_POST[$obj] = $this->_mysql->real_escape_string($tmp);
     }
        return $_POST;
    }
    public function db_createJson($array){
       return json_encode($array);
    }
}
?>
