<?php 
	include "conn.php";
	
	  
	    $book_id = mysqli_real_escape_string($connect,  $_POST['book_id']);
	    $student_id = mysqli_real_escape_string($connect, $_POST['student_id']); 
	  
	 
	        $query = "INSERT IGNORE INTO wishlist (book_id,student_id) VALUES('$book_id', '$student_id')";
	    $results = mysqli_query($connect, $query);
	    if($results>0)
	    {
	        echo "Book has been added to wishlist successfully";
	    }

	    
?>