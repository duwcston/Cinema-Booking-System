
<?php
include_once 'header.php';
?>
<html>
	<head>
			<title>Spy x Family Movie: Code: White</title>
					<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

					<!-- Optional theme -->
					<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

					<!-- Latest compiled and minified JavaScript -->
					<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</head>
	<style>
		table,th,td
		{
			border: 2px color:transparent;
			font-family: monospace;
			font-size: 150%;
			padding: 0.25cm;
			background-color: black;

		}
		body{
				background-image: url("images/curtain.jpg");
				-moz-background-size: cover;
				-webkit-background-size: cover;
				background-size: cover;
				background-position: top center !important;
				background-repeat: no-repeat !important;
				background-attachment: fixed;   
				color: white;
			}
		button 
		{
			display: block;
			margin: 0 auto;
			width: 10%;
			height: 40px;
			border: none;
			background-color: #222;
			font-family: arial;
			font-size: 16px;
			color: #fff;
			 cursor: pointer;
		}	
	</style>

	<head>
		<h1 align="middle" style="font-size: 500%;"><u>Spy x Family Movie: Code: White</u></h1>
	</head>


	<body  style="background-color: powderblue; font-family: monospace; margin: 0; padding: 0;">
		<h1>      </h1>
		<div class="container">
	<div class="poster">
	  <img class="movie-image" src="images/Spy.png"  >
	</div>
    </div>
		</p>
		
		
		<br><br><br><br>

		<?php
		$dbServername = "localhost";
		$dbUsername = "root";
		$dbPassword = "1234";
		$dbName = "test";

		$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

		$sql = "SELECT description,genre,mov_lang,dir_name,stars from movie m,director d,rating r where d.dir_id=m.dir_id and r.mov_id=m.mov_id and mov_name='Spy x Family Movie: Code: White'; ";
		mysqli_query($conn, $sql) or die('Error');
		$result = mysqli_query($conn, $sql);
		while ($row = mysqli_fetch_array($result)) {
			echo '<table style="margin-left: 20%; margin-right: 20%; border-collapse: collapse; border: 1px solid #ddd; font-family: sans-serif; font-size: 16px; background-color: #f5f5f5; border-radius: 5px;">
			<thead>
			  <tr style="background-color: #4285f4; color: #fff; padding: 10px;">
				<th style="font-weight: bold; text-align: left;">Movie Details</th>
			  </tr>
			</thead>
			<tbody>
			  <tr style="background-color: #fff;">
				<td style="padding: 10px; width: 30%;"><b>Description</b></td>
				<td style="padding: 10px;">' . $row['description'] . '</td>
			  </tr>
			  <tr style="background-color: #f2f2f2;">
				<td style="padding: 10px;"><b>Genre</b></td>
				<td style="padding: 10px;">' . $row['genre'] . '</td>
			  </tr>
			  <tr style="background-color: #fff;">
				<td style="padding: 10px;"><b>Language</b></td>
				<td style="padding: 10px;">' . $row['mov_lang'] . '</td>
			  </tr>
			  <tr style="background-color: #f2f2f2;">
				<td style="padding: 10px;"><b>Director</b></td>
				<td style="padding: 10px;">' . $row['dir_name'] . '</td>
			  </tr>
			  <tr style="background-color: #fff;">
				<td style="padding: 10px;"><b>Rating</b></td>
				<td style="padding: 10px;">' . $row['stars'] . '</td>
			  </tr>
			</tbody>
		  </table>
		  ';
		}
		?>

		<h1 align="middle" style="font-size: 300%;"><u><b>Cast</b></u></h1>

		<?php
		$sql1 = "SELECT actor_name,role from actor a,movie m,movie_cast mc where a.actor_id=mc.actor_id and mc.mov_id=m.mov_id and m.mov_name='Spy x Family Movie: Code: White';";
		mysqli_query($conn, $sql) or die('Error');
		$result1 = mysqli_query($conn, $sql1);
		echo '<br><table style="margin-left: auto; margin-right: auto;">
					<tr align="middle">
				  		<td><u><b>Actor</b></u></td>
				  		<td><u><b>Role</b></u></td>
					</tr>';
		while ($row = mysqli_fetch_array($result1)) {
			echo '<tr>
							<td>' . $row['actor_name'] . '</td>
							<td align="middle">' . $row['role'] . '</td>
					  </tr>';
		}

		echo '</table><br><br><br>';

		$_SESSION['mov_name'] = "Spy x Family Movie: Code: White";

		?>

		<center><a href="nowshowing.php"  class="btn btn-default btn-lg"  style="font-size:15px padding-top:0.25%;  font-family: comic sans ms; color: black" role="button"><b>Book now</b></a></center><br>
		

	</body>
</html>
	
<?php
include_once 'footer.php';
?>
