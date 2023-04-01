<?php
session_start();
require_once '../components/db_connect.php';



$sql = "SELECT * FROM animals";
$result = mysqli_query($connect, $sql);
$tbody = '';

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $tbody .= "
        <div class='col p-3'>
            <div class='card p-0 shadow-lg bg-body rounded all-animals'>
                <img class='card-img-top' src='../pictures/" . $row['picture'] . "'alt='" . $row['name'] . "'>
                <h4 class='card-header text-center'>" . $row['name'] . "</br>" . $row['breed'] . "</h4>
                <div class='card-body p-2'>
                    <p class='card-text'>" . $row['description'] . "</p>
                    <p class='h6'>
                    Age: " . $row['age'] . " years 
                    </p>
                    <p class='h6'>
                    Vaccination Status: " . $row['vaccinated'] . "
                    </p>
                </div>
                <div class='card-footer text-center'>
                   <a class='btn btn-small bg-info' href='details.php?id=" . $row['id'] . "'>Show Details</a>
                </div>
            </div>
        </div>";
    }
} else {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}

$query = "SELECT * FROM users WHERE id={$_SESSION['user']}";
$res = mysqli_query($connect, $query);
$row = mysqli_fetch_assoc($res);

$firstname = $row['first_name'];
$lastname = $row['last_name'];

$email = $row['email'];
$pic = $row['picture'];
$status = $row['status'];

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animal Adoption</title>
    <?php require_once '../components/boot.php' ?>
    <style type="text/css">
        .manageProduct {
            margin: auto;
        }

        .img{
            width: 60px;
            height: 60px ;
        }

        td {
            text-align: left;
            vertical-align: middle;
        }

        tr {
            text-align: right;
        }
    </style>
</head>


    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
    <li class="nav-item">
    <a class="nav-link text-center" href="../home.php">homie <?php echo $row['first_name'] . " " . $row['last_name'] ;?></a>
    </li>
    </ul>
  </div>
</nav>

<body>
    
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 cont">
            <?= $tbody; ?>
        </div>
    </div>
</body>
</html>