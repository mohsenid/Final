<?php
session_start();
include("./include/config.php");
include("./include/db.php");

$query = "SELECT * FROM categories";

$categories = $db->query($query);

?>
<!DOCTYPE html>
<html lang="en" >

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />
    <link rel="stylesheet" href="./css/style.css" />

    <link rel="icon" type="imag/x-icon" href="img/favicon.ico">
    <title> MyBlog </title>
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <?php 
                // SHOW DISCONNECT LINK IF USER IS LOG IN
                if(!empty($_SESSION)){
                    echo '<a class="link order-md-2" href="disconnect.php">
                

                 Disconnect
            </a>';
                }else{
                    echo '<a class="link order-md-2" href="connection.php">
                

                 Login/registration
            </a>';
                }
            ?>
            
            
            <a class="navbar-brand order-md-2" href="index.php">
                <img src="./img/logo.png" alt="Logo">

                 Myblog.com
            </a>
            <button class="navbar-toggler" data-target="#my-nav" data-toggle="collapse" aria-controls="my-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="my-nav" class="collapse navbar-collapse">
                <ul class="navbar-nav order-md-1">
                    <?php
                    if ($categories->rowCount() > 0) {
                        foreach ($categories as $category) {
                            ?>
                            <li class="nav-item <?php echo ( isset($_GET['category']) && $category['id'] == $_GET['category']) ? "active" : ""; ?> ">
                                <a class="nav-link" href="index.php?category=<?php echo $category['id'] ?>"> <?php echo $category['title'] ?> </a>
                            </li>
                    <?php
                        }
                    }
                    ?>
                </ul>
            </div>
        </div>
    </nav>