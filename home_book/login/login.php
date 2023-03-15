<?php
if($_POST) {

    include 'conn.php';

    $username = $_POST['username'];
    $password = $_POST['password'];

    $consult = $connect->query("SELECT * FROM authentication WHERE username = '".$username."' and password = '".$password."'");

    while($extractdata = $consult->fetch_assoc()){
        $result[] = $extractdata;
    }

    echo json_encode($result);
    
}else {
    echo "Nothing is posted";
}

?>