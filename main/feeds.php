<?php
class feeds extends database{
  public function initial(){

  }
  public function loadFeeds(){
        //$_POST = array('user_id'=>'23');
        if(!empty($_POST['user_id'])){
          $data = array();
              $user_id = $_POST['user_id'];
              $q_res = $this->storedProcedure("posts('select','','$user_id','')");
              while($res = $q_res->fetch_object()){
                    array_push($data,$res);
              }
              echo json_encode($data);

        }
        $this->empty_error();
  }
}
 ?>
