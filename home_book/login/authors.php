<?php

    include "conn.php";

 $table = "author"; 
 
 $author_id = mysqli_real_escape_string($connect,  $_POST['author_id']);


 $sql = "SELECT * from author WHERE author_id = '$author_id'";
 $db_data = array();

 $result = $connect->query($sql);
 if($result->num_rows > 0){
 while($row = $result->fetch_assoc()){
 $db_data[] = $row;
 }

 echo json_encode($db_data);
 }else{
 echo "error";
 }
 $connect->close();
 
 return;

?>