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

$query = "SELECT E._Grade, COUNT(*) as 'Count'
                        FROM COURSE C, SECTION S, ENROLLMENT E
                        WHERE C._Course_no = S._Cno
                        AND S._Sno = E._Section_no
                        AND E._Section_no = ".$_POST["SectionN"]." AND C._Course_no = '".$_POST["CourseN"]."'
                        GROUP BY E._Grade;";
$result = $link->query($query);
echo "Course Number: ".$_POST["CourseN"],"<br>";
echo "Section Number: ".$_POST["SectionN"],"<br>";
while($row = $result->fetch_assoc()){
        printf("Grade: %s<br>\n", $row["_Grade"]);
        printf("Count: %s<br>\n", $row["Count"]);
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