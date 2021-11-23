<?php
$query_categories = "SELECT * FROM categories";

$categories = $db->query($query_categories);

?>
<div class="col-md-4 mb-3">

    <div class="card bg-light mb-3">
        <div class="card-body">
            <h5 class="card-title"> Search the blog </h5>
            <form action="search.php" method="get">
                <div class="input-group mb-3">
                    <div class="input-group-prepend order-2">
                        <button class="btn btn-outline-primary" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                    <input name="search" type="text" class="form-control" placeholder="Search...">
                </div>
            </form>
        </div>
    </div>


    <div class="list-group mb-3">
        <a href="#" class="list-group-item list-group-item-action active">
            categories
        </a>
        <?php
        if ($categories->rowCount() > 0) {
            foreach ($categories as $category) {
                ?>
                <a href="index.php?category=<?php echo $category['id'] ?>" class="list-group-item list-group-item-action">
                    <?php echo $category['title'] ?>
                </a>
        <?php
            }
        }

        ?>

    </div>


    <div class="card bg-light mb-3 p-3">
        <div class="card-body">
            <?php
            if (isset($_POST['subscribe'])) {
                if (trim($_POST['name']) != "" || trim($_POST['email']) != "") {

                    $name = $_POST['name'];
                    $email = $_POST['email'];

                    $subscribe_insert = $db->prepare("INSERT INTO subscribers (name, email) VALUES (:name , :email)");
                    $subscribe_insert->execute(['name' => $name, 'email' => $email]);

                } else {
                    echo "Fields should not be empty";
                }
            }
            ?>
            <form method="post">
                <div class="form-group">
                    <label for="name"> Name </label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Enter your name.">

                </div>
                <div class="form-group">
                    <label for="email"> Email </label>
                    <input type="email" name="email" class="form-control" id="email"placeholder="Enter your email.">
                </div>

                <button type="submit" name="subscribe" class="btn btn-outline-primary btn-block"> Send </button>
            </form>
        </div>
    </div>

    <div class="card p-3">
        <div class="card-body">
            <h3> About US </h2>
                <p class="text-justify">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget ipsum faucibus, sollicitudin ligula ut, pharetra magna. Quisque faucibus id diam eu tempus. Pellentesque augue lectus, bibendum non tellus et, finibus porttitor purus. Aenean auctor eget ante eget tristique. Duis dapibus tempus elit id rhoncus. Nunc sed urna eget odio pellentesque dictum sed eu purus. Suspendisse purus felis, vehicula sit amet convallis sed, semper nec quam. Sed rutrum sem sit amet lacus egestas accumsan. Fusce bibendum, lacus ac dignissim feugiat, felis massa varius leo, eu bibendum mauris dolor nec nisi.
               </p>
        </div>
    </div>

</div>
