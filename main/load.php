<?php
class load  extends database{
         private $_tmp=array();
    public function register(){
//         $_POST=array("name"=>"praveen","mail"=>"pkumar@gmail.com");
                  $data=$this->DB_refreshData();
        $res=$this->oneFetchProcedure("sp_user_exist_register('$data[mail]','(name,mail)values(\'$data[name]\',\'$data[mail]\')')");
        if($res->result=='exist'){
                $this->_tmp["status"]="exist";
        }
        else if($res->result=='ok'){
          $this->_tmp["status"]="ok";
          $this->_tmp["uid"]=$res->id;
        }
        else{
            $this->_tmp["status"]="error";
        }
        return $this->db_createJson($this->_tmp);

    }

}
?>