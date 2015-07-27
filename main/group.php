<?php
class group extends database {
  public function initial(){

  }
  public function create(){
    //$_POST = array('user_id'=>'7','name'=>'praveen test');
    if(!empty($_POST['user_id']) && !empty($_POST['name']) ){
      $name = $_POST['name'];
      $user_id = $_POST['user_id'];
      echo $this->jsonOneFetchProcedure("sp_group('create','$name','$user_id')");
        return;
    }
    $this->empty_error();
  }
  public function update(){
      //$_POST = array('type'=>'update_desc','data'=>'sample descRiption','group_id'=>'6');
      if(!empty($_POST['type']) && !empty($_POST['data']) && !empty($_POST['group_id'])){
        $type = $_POST['type'];
        $data  = $_POST['data'];
        $group_id = $_POST['group_id'];
        echo $this->jsonOneFetchProcedure("sp_group('$type','$data','$group_id')");
        return;
      }
      $this->empty_error();
  }
  public function join(){
    $_POST = array('user_id'=>'8','group_id'=>'4');
    if(!empty($_POST['user_id']) && !empty($_POST['group_id'])){
      $user_id  = $_POST['user_id'];
      $group_id = $_POST['group_id'];
      echo $this->jsonOneFetchProcedure("group_fn('join','$group_id','$user_id')");
      return;
    }
    $this->empty_error();
  }
}
 ?>
