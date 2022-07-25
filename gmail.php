<?php

$name=$_POST['name'];
$email= $_POST['email'];
$purpose=$_POST['purpose'];
$message=$_POST['message'];

$to = "gurkanwaljot02@gmail.com";
$subject= "Mail FROM PORTFOLIO WEBSITE";
$txt ="Name = ". $name . "\r\n  Email = " . $email . "\r\n Purpose = " . $purpose. "\r\n Message =" . $message;
$headers = "From: demo@gmail.com" . "\r\n" .
"CC: somebodyelse@example.com";

if(mail($to, $subject, $txt, $headers)){
    header("Location:index.html");
}
else{
    echo 'not sent';
}

?>