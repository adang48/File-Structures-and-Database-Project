<html>
<body>

<div id="main">

<h1>CPSC 332 2021 Term Project</h1>
<h2></h2><br>
</div>

<div style="background-color:white;">
<fieldset>
<legend>Query Results:</legend>

<?php

$link = mysqli_connect('mariadb','cs332d17','yahViT1m','cs332d17');

if(!$link) {
	echo 'Connection failed';
        die('Could not connect: '. mysql_error());
}
echo 'Connected successfully<p>';

$query = "SELECT C._Title, E._Grade
                        FROM COURSE C, SECTION S, ENROLLMENT E
                        WHERE E._Student_no = ".$_POST["stuCWID"]." AND S._Sno = E._Section_no AND S._Cno = C._Course_no;";
$result = $link->query($query);
echo "CWID: ".$_POST["stuCWID"],"<br>";
while($row = $result->fetch_assoc()){
        printf("Course Title: %s<br>\n", $row["_Title"]);
        printf("Grade: %s<br>\n", $row["_Grade"]);
}
?>

<button onclick="goBack()">Go Back</button>

<script>
function goBack() {
    window.history.back();
}
</script>

</fieldset>
</div>
</body>
</html>