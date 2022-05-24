<?php
session_start();
include("./include/config.php");
include("./include/db.php");

if(isset($_POST["login"])){
    $email = htmlspecialchars($_POST["email"]);
    $mdp = htmlspecialchars($_POST["password"]);
  
    if(!empty($email) && !empty($mdp)){
        if(filter_var($email, FILTER_VALIDATE_EMAIL)){
          $select = $db -> prepare("SELECT * FROM users WHERE email = ?");
          $select -> execute([$email]);
  
          $result = $select -> fetch();
          //بخاطر اینکه جواب صحیح یه ارایه هست و فقط صحیح نیست از فالس استفاده میکنیم
          if($result !== false){
  
            $mdpBdd = $result["password"];
            // بصورت پیشفرض جواب شرط صحیح هس
            if(password_verify($mdp, $mdpBdd)){
              $_SESSION["email"] = $result["email"];
              header("Location: index.php");
              exit();
    } else {
        header("Location:signin.php?err_msg= Email and password fields are required");
        exit();
    }
}

}
}
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="./css/admin.css" />

    <title>MyBlog Login</title>
</head>

<body>
    <div class="container">

        <div class="row d-flex justify-content-center align-items-center" style="height: 100vh">
            <div class="card bg-dark">
                <?php
                if (isset($_GET['err_msg'])) {
                    ?>
                    <div class="alert alert-danger" role="alert">
                        <?php echo $_GET['err_msg'] ?>
                    </div>
                <?php
                }
                ?>
                <h3 class="text-white text-center pt-3"> Log in </h2>
                    <div class="card-body" style="width: 400px">
                        <form method="post">
                            <div class="form-group">
                                <label class="text-white" for="email"> Email </label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email.">
                            </div>
                            <div class="form-group">
                                <label class="text-white" for="password"> Password </label>
                                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password">
                            </div>

                            <button type="submit" name="login" class="btn btn-outline-primary btn-block"> Log in</button>
                        </form>
                    </div>

            </div>
        </div>
    </div>
</body>