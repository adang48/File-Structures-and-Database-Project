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

$query = "SELECT S._Sno, S._Classroom, S._Meeting_days, S._Start_time, S._End_time, COUNT(*) AS '_Count'
                        FROM SECTION S, ENROLLMENT E
                        WHERE S._Sno = E._Section_no AND S._Cno =".$_POST["CourseN"];
$result = $link->query($query);
echo "Course Number: ".$_POST["CourseN"],"<br>";
while($row = $result->fetch_assoc()){
        printf("Section Number: %s<br>\n", $row["_Sno"]);
        printf("Section Classroom: %s<br>\n", $row["_Classroom"]);
        printf("Section Meeting Days: %s<br>\n", $row["_Meeting_days"]);
        printf("Start Time: %s<br>\n", $row["_Start_time"]);
        printf("End Time: %s<br>\n", $row["_End_time"]);
        printf("Number of Students Enrolled: %s<br>\n", $row["_Count"]);
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