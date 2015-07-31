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
  public function search(){
    //$_POST = array('user_id'=>'7','search_content'=>'up');
    //todo check minimum length in search_content
    if(!empty($_POST['user_id']) && !empty($_POST['search_content'])){
      $user_id = $_POST['user_id'];
      $search_content = $_POST['search_content'];
      //echo '<pre>';
      $data = array();
      $q_res = $this->query_exe("SELECT g.id,name,(select id from members where  g_id = g.id and u_id ='$user_id') exist FROM `group` as g where name LIKE '%$search_content%'");
      while($res = $q_res->fetch_object()){
            array_push($data,$res);
      }
      echo json_encode($data);
    }
  }
}
 ?>
