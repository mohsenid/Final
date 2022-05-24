<?php
     include("./include/header.php");
    //  ----------------------REGISTRATION-------------------
    
  $erreur = "";
  $success = "";
  if(isset($_POST["submit"])){ 
  // on récupére les données des inputs
    // var_dump($_POST);
    $email = htmlspecialchars( $_POST["email"]);
    $mdp = htmlspecialchars($_POST["password"]);
    $mdp2 = htmlspecialchars($_POST["passwordConfirm"]);

    if(!empty($email) && !empty($mdp) && !empty($mdp2)){
      if(filter_var($email, FILTER_VALIDATE_EMAIL)){
          if($mdp === $mdp2){
              $select = $db->prepare("SELECT * FROM users WHERE email = ?");
              $select ->execute([$email]);
              
              $count = $select->rowCount();
              if($count === 0){
                $mdphash = password_hash($mdp, PASSWORD_DEFAULT);

                $insert = $db ->prepare("INSERT INTO users(email, password) VALUES (?, ?)");
                $insert -> execute([$email, $mdphash]);

                $success = "Welcome ! Please log in";
              }else{
                $erreur = "You are already registered please login !";
              }
          }else{
            $erreur = "Passwords are not the same !";
          }
      }else{
        $erreur = "Please enter a valid email !";
      }
    }else{
      $erreur = "Please fill in the fields !";
    }

    
}

?>



<div class="wrapper">

<form action="" method="POST" class="form-signin">       
    <h2 class="form-signin-heading">Please Register</h2>
    <h4 style="color:red"><?php echo $erreur ?></h4>
    <h4 style="color:green"><?php echo $success ?></h4>
    <input type="email" class="form-control" name="email" placeholder="Enter Email Address" required=""  />
    <input type="password" class="form-control" name="password" placeholder="Enter Password" required=""/>      
    <input type="password" class="form-control" name="passwordConfirm" placeholder="Confirm Password" required=""/>      
    <button class="btn btn-lg btn-primary btn-block" name="submit" type="submit">Register</button>   
    </form>
</div>

<?php include("./include/footer.php") ?>