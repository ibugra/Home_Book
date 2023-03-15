<?php 
	include "conn.php";

    $book_status = mysqli_real_escape_string($connect,  $_POST['book_status']);
    $book_id = (int)$_POST['book_id'];
  
    $query = "UPDATE book SET book_status = '".$book_status."' WHERE book_id = '".$book_id."'";

    $results = mysqli_query($connect,$query);

    if($results>0)
    {
        echo "Book has been given successfully";
    }

?>
