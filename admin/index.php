<?php
include("./include/header.php");

if (isset($_GET['entity']) && isset($_GET['action']) && isset($_GET['id'])) {

    $entity = $_GET['entity'];
    $action = $_GET['action'];
    $id = $_GET['id'];

    if ($action == "delete") {

        if ($entity == "post") {
            $query = $db->prepare('DELETE FROM posts WHERE id = :id');
        } elseif ($entity == "category") {
            $query = $db->prepare('DELETE FROM categories WHERE id = :id');
        } else {
            $query = $db->prepare('DELETE FROM comments WHERE id = :id');
        }
        
        $query->execute(['id' => $id]);
    } else {
        $query = $db->prepare("UPDATE comments SET status='1' WHERE id = :id");
        $query->execute(['id' => $id]);
    }
}

$query_posts = "SELECT * FROM posts ORDER BY id DESC";
$posts = $db->query($query_posts);

$query_comments = "SELECT * FROM comments WHERE status='0' ORDER BY id DESC";
$comments = $db->query($query_comments);

$query_categories = "SELECT * FROM categories ORDER BY id DESC";
$categories = $db->query($query_categories);

?>

<div class="container-fluid">
    <div class="row">

        <?php include('./include/sidebar.php') ?>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2"> Dashboard </h1>
            </div>

            <h3> Recent Articles </h3>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th> Title </th>
                            <th> Author </th>
                            <th> Settings </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($posts->rowCount() > 0) {
                            foreach ($posts as $post) {
                                ?>
                                <tr>
                                    <td> <?php echo $post['id'] ?> </td>
                                    <td> <?php echo $post['title'] ?> </td>
                                    <td> <?php echo $post['author'] ?> </td>

                                    <td>
                                        <a href="edit_post.php?id=<?php echo $post['id'] ?>" class="btn btn-outline-info"> Edit </a>
                                        <a href="index.php?entity=post&action=delete&id=<?php echo $post['id'] ?>" class="btn btn-outline-danger"> Delete </a>
                                    </td>
                                </tr>
                            <?php
                                }
                            } else {
                                ?>
                            <div class="alert alert-danger" role="alert">
                                There is no article to display !!!
                            </div>
                        <?php
                        }
                        ?>

                    </tbody>
                </table>
            </div>

            <h3> Recent Comments </h3>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th> Name </th>
                            <th> Comment </th>
                            <th> Settings </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($comments->rowCount() > 0) {
                            foreach ($comments as $comment) {
                                ?>
                                <tr>
                                    <td> <?php echo $comment['id'] ?> </td>
                                    <td> <?php echo $comment['name'] ?> </td>
                                    <td> <?php echo $comment['comment'] ?> </td>

                                    <td>
                                        <a href="index.php?entity=comment&action=approve&id=<?php echo $comment['id'] ?>" class="btn btn-outline-success"> Confirm </a>
                                        <a href="index.php?entity=comment&action=delete&id=<?php echo $comment['id'] ?>" class="btn btn-outline-danger"> Delete </a>
                                    </td>
                                </tr>
                            <?php
                                }
                            } else {
                                ?>
                            <div class="alert alert-danger" role="alert">
                                There are no comments to display !!!
                            </div>
                        <?php
                        }
                        ?>

                    </tbody>
                </table>
            </div>

            <h3> Categories </h3>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th> Title </th>
                            <th> Settings </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($categories->rowCount() > 0) {
                            foreach ($categories as $category) {
                                ?>
                                <tr>
                                    <td> <?php echo $category['id'] ?> </td>
                                    <td> <?php echo $category['title'] ?> </td>
                                    <td>
                                        <a href="edit_category.php?id=<?php echo $category['id'] ?>" class="btn btn-outline-info"> Edit </a>
                                        <a href="index.php?entity=category&action=delete&id=<?php echo $category['id'] ?>" class="btn btn-outline-danger"> Delete </a>
                                    </td>
                                </tr>
                            <?php
                                }
                            } else {
                                ?>
                            <div class="alert alert-danger" role="alert">
                                There is no category to display !!!
                            </div>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </main>

    </div>

</div>
