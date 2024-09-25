<?php
require_once('model.php');

class auth extends model {

    public function login($username, $password){
        $sql = $this->db->prepare("SELECT * FROM kasir WHERE username=? AND password=? LIMIT 1");
        $sql->bindParam(1, $username);
        $sql->bindParam(2, $password);
        $sql->execute();

        $row = $sql->fetch(PDO::FETCH_LAZY);
        return $row;
    }

	public function getUserInfo($username){
		$sql = $this->db->prepare("SELECT username, email, fullname, akses FROM kasir WHERE username=? LIMIT 1");
		$sql->bindParam(1, $username);
		$sql->execute();
		
		return $sql->fetch(PDO::FETCH_ASSOC);
	}
	
	
}

$auth = new auth;
?>
