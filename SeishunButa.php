
<?php
include_once 'header.php';
?>
<html>
	<head>
			<title>Rascal Does Not Dream of a Knapsack Kid</title>
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
		<h1 align="middle" style="font-size: 500%;"><u>Rascal Does Not Dream of a Knapsack Kid</u></h1>
	</head>


	<body  style="background-color: powderblue; font-family: monospace; margin: 0; padding: 0;">
		<h1>      </h1>
		<div class="container">
	<div class="poster">
	  <img src="images/Rascal.jpg" >
	</div>
	<div class="info">
	  <p><b>Description:</b> Finally, the day of Mai's high school graduation has arrived. While Sakuta eagerly waits for his girlfriend, an elementary schooler who looks exactly like her appears before him. Suspicious, and for all the wrong reasons... Meanwhile, Sakuta and Kaede's father suddenly calls, saying that their mother wants to see her daughter. She was hospitalized because Kaede's condition had been too much for her to bear, so what could she possibly want now?</p>
	  <p><b>Language:</b> Japanese with English Sub</p>
	  <p><b>Genre:</b> Drama, Romance, Supernatural</p>
	  <p><b>Director:</b> Yūichirō Kurokawa</p>
	  <p><b>Rating:</b> PG-13 - Teens 13 or older</p>
	  <p><b>Release Date:</b> 1/12/2023</p>
	  <p><b>Trailer:</b> <a href="https://www.youtube.com/watch?v=dNxfHUwQRt8" class="trailer-link">Watch Now</a></p>	  
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

		$sql = "SELECT description,genre,mov_lang,dir_name,stars from movie m,director d,rating r where d.dir_id=m.dir_id and r.mov_id=m.mov_id and mov_name='Rascal Does Not Dream of a Knapsack Kid'; ";
		mysqli_query($conn, $sql) or die('Error');
		$result = mysqli_query($conn, $sql);
		while ($row = mysqli_fetch_array($result)) {
			echo '<table style="margin-left:20%; margin-right:20%;">
							
							<tr>
								<td><u><b> Description</b></u></td>
								<td>' . $row['description'] . '</td>
							</tr>
							<tr>
								<td><u><b> Genre</b></u></td>
								<td>' . $row['genre'] . '</td>
							</tr>
							<tr>
								<td><u> <b>Language</b> </u></td>
								<td>' . $row['mov_lang'] . '</td>
							</tr>
							<tr>
								<td><u><b> Director </b></u></td>
								<td>' . $row['dir_name'] . '</td>
							</tr>
							<tr>
								<td><u><b>Rating </b></u></td>
								<td>' . $row['stars'] . '</td>
							</tr>
					</table><br><br><br><br>';
		}
		?>

		<h1 align="middle" style="font-size: 300%;"><u><b>Cast</b></u></h1>

		<?php
		$sql1 = "SELECT actor_name,role from actor a,movie m,movie_cast mc where a.actor_id=mc.actor_id and mc.mov_id=m.mov_id and m.mov_name='Rascal Does Not Dream of a Knapsack Kid';";
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

		$_SESSION['mov_name'] = "Rascal Does Not Dream of a Knapsack Kid";

		?>

		<center><a href="nowshowing.php"  class="btn btn-default btn-lg"  style="font-size:15px padding-top:0.25%;  font-family: comic sans ms; color: black" role="button"><b>Book now</b></a></center><br>
		

	</body>
</html>
	
<?php
include_once 'footer.php';
?>
