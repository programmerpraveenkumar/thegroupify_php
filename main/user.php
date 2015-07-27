<?php
class user extends database{
  public function create(){
  //  $_POST['email'] = 'kumarpraveen@addresspager.com';
    if(!empty($_POST['email'])){
        $email = $_POST['email'];
        echo $this->jsonOneFetchProcedure('create_account(\''.$email.'\',\''.uniqid().'\')');
        return;
    }
    $this->empty_error();
  }
  public function initial(){

  }
}
 ?>
