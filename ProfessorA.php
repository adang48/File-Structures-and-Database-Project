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

$query = "SELECT P._Ssn, C._Title, S._Classroom, S._Meeting_days, S._Start_time, S._End_time
                        FROM COURSE C, SECTION S, PROFESSOR P
                        WHERE S._Instructor_ssn = P._Ssn
                        AND S._Cno = C._Course_no
                        AND P._Ssn =" .$_POST["query_args"];
$result = $link->query($query);
echo "Professor SSN: ".$_POST["query_args"],"<br>";
while($row = $result->fetch_assoc()){
        printf("Course Title: %s<br>\n", $row["_Title"]);
        printf("Section Classroom: %s<br>\n", $row["_Classroom"]);
        printf("Section Meeting Days: %s<br>\n", $row["_Meeting_days"]);
        printf("Start Time: %s<br>\n", $row["_Start_time"]);
        printf("End Time: %s<br>\n\n\n", $row["_End_time"]);
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