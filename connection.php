<?php 
    include("./include/header.php");
    // -------------------------------connextion-------------------------
// var_dump($_POST);
$erreurCo = "";
$successCo = "";
if(isset($_POST["submitConnection"])){
  $email = htmlspecialchars($_POST["email"]);
  $mdp = htmlspecialchars($_POST["mdp"]);

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
          }else{
            $erreurCo = "Password is incorrect!";
          }
        }else{
          $erreurCo = "Email is not recognized !";
        }
        // var_dump($result);
      }else{
        $erreurCo = "Please enter a valid email !";
      }
  }else{
    $erreurCo = "Please fill in the fields !";
  }
}

?>





    <div class="wrapper">

        <form action="" method="POST" class="form-signin text-center">       
        <h4 style="color:red"><?php echo $erreurCo ?></h4>
        <h4 style="color:green"><?php echo $successCo ?></h4>
        <h2 class="form-signin-heading">Please login</h2>
        <input type="email" class="form-control" name="email" placeholder="Email Address" required="" autofocus="" />
        <input type="password" class="form-control" name="mdp" placeholder="Password" required=""/> 
        <button class="btn btn-lg btn-primary btn-block" name="submitConnection" type="submit">Login</button>   
        <p>You are not member yet? <a href="./registration.php">click here</a> </p>     
        </form>
    </div>

    <?php include("./include/footer.php") ?>