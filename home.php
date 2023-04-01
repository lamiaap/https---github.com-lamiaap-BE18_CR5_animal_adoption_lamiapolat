<?php
session_start();
require_once 'components/db_connect.php';

// if adm will redirect to dashboard
if (isset($_SESSION['adm'])) {
    header("Location: dashboard.php");
    exit;
}
// if session is not set this will redirect to login page
if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: index.php");
    exit;
}

// select logged-in users details - procedural style
$res = mysqli_query($connect, "SELECT * FROM users WHERE id=" . $_SESSION['user']);
$row = mysqli_fetch_array($res, MYSQLI_ASSOC);

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@800&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Edu+NSW+ACT+Foundation:wght@500&display=swap" rel="stylesheet">
    <title>Welcome - <?php echo $row['first_name']; ?></title>
   

    <?php require_once 'components/boot.php' ?>
   
    <style>
        .userImage {
            width: 200px;
            height: 200px;
        }
    

        .hero {
            background: rgb(207,56,138);
            background: radial-gradient(circle, rgba(207,56,138,1) 0%, rgba(207,121,139,1) 100%);
        }
    
        
        a {
            text-decoration:none;
            font-family: 'Playfair Display', serif;
            font-size:large;
            color:white;
        }

        a:hover{
            color: purple;
        }

        div{
            align-items:center;
        }

      
        
    </style>
</head>

<body>



    <div class="container">
        <div class="hero">
            <img class="userImage" src="pictures/https://cdn.dribbble.com/users/1205252/screenshots/16000669/media/c14399882d901df924021e6bd9ab12f2.jpg?compress=1&resize=400x300/<?php echo $row['picture']; ?>" alt="">
            <p class="text-white">Hi <?php echo $row['first_name']; ?></p>
            <a href="animals/home.php">Available Pets</a>
            <a href="update.php?id=<?php echo $_SESSION['user'] ?>">Update your profile</a>
            <a href="logout.php?logout">Sign Out</a>

    
        </div>
        
        
      
       
    </div>

   
</body>
</html>