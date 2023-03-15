<?php 
	include "conn.php";

   
    $student_id = mysqli_real_escape_string($connect,  $_POST['student_id']);
    $student_name = mysqli_real_escape_string($connect, $_POST['student_name']);
    $student_surname = mysqli_real_escape_string($connect, $_POST['student_surname']);
    $email = mysqli_real_escape_string($connect, $_POST['email']);
    $password = mysqli_real_escape_string($connect, $_POST['password']);
    $id = mysqli_real_escape_string($connect, $_POST['id']);
    $username = mysqli_real_escape_string($connect, $_POST['username']);
    $level = mysqli_real_escape_string($connect, $_POST['level']);


    $query = "INSERT INTO student (student_id, student_name, student_surname, email, password) VALUES('$student_id', '$student_name','$student_surname','$email','$password')";
	$query6 = "INSERT INTO authentication (id, username, password, level) VALUES('$id', '$username', '$password', '$level')";
	

    $results = mysqli_query($connect,$query);
    $results2 = mysqli_query($connect,$query6);

    if($results>0)
    {
        echo "Student has been added succesfully";
    }

?>
