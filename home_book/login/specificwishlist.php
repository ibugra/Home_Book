<?php

 $table = "book"; 
 
 $conn = new mysqli("localhost","root","","login");
 
 if($conn->connect_error){
 die("Connection Failed: " . $conn->connect_error);
 return;
 }

 
 $book_id = mysqli_real_escape_string($connect,  $_POST['book_id']);

 $sql = "SELECT * from $table WHERE book_id = ";
 $db_data = array();

 $result = $conn->query($sql);
 if($result->num_rows > 0){
 while($row = $result->fetch_assoc()){
 $db_data[] = $row;
 }
 echo json_encode($db_data);
 }else{
 echo "error";
 }
 $conn->close();
 
 return;

?>