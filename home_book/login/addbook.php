<?php 
	include "conn.php";
	
	  
	    $publisher_id = mysqli_real_escape_string($connect,  $_POST['publisher_id']);
	    $author_id = mysqli_real_escape_string($connect, $_POST['author_id']);
	    $book_title = mysqli_real_escape_string($connect, $_POST['book_title']);
	    $book_status = mysqli_real_escape_string($connect, $_POST['book_status']);
	    $book_genre = mysqli_real_escape_string($connect, $_POST['book_genre']);
	    $ISBN = mysqli_real_escape_string($connect, $_POST['ISBN']);
	  
	 
	        $query = "INSERT INTO book (publisher_id, author_id,book_title,book_status,book_genre,ISBN) VALUES('$publisher_id', '$author_id','$book_title','$book_status','$book_genre','$ISBN')";
	    $results = mysqli_query($connect, $query);
	    if($results>0)
	    {
	        echo "Book has been added successfully";
	    }

	    
?>