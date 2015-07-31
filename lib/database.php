<?php
class database{
    protected $_mysql;
    public  function __construct() {
        $this->_mysql = new mysqli('localhost',"root","",'groupify');

    }
    protected function storedProcedure($qury){
//      echo $qury;die('');
        return $this->_mysql->query('call '.$qury);
    }
    protected function oneFetchProcedure($qury){
        $get = $this->storedProcedure($qury);
        return $get->fetch_object();
    }
    protected function jsonOneFetchProcedure($qury){
      return json_encode(array_merge(array('error'=>''),(array)$this->oneFetchProcedure($qury)));
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
    public function empty_error(){
          echo json_encode(array("empty"=>'false'));
    }
    public function query_exe($q){
//      echo $q;
      return $this->_mysql->query($q);
    }
    public function one_fetch_query($q){
        $res = $this->query_exe($q);
        if($res->num_rows == 1)
          return $this->fetch_object();
          else
          return false;
    }
}
?>
