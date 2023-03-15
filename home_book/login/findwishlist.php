<?php

    include "conn.php";

 $table = "wishlist"; 
 
 $student_id = mysqli_real_escape_string($connect,  $_POST['student_id']);


 $sql = "SELECT * from book WHERE book_id IN (SELECT book_id FROM wishlist WHERE student_id = '$student_id')";
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