<?php
//These are the defined authentication environment in the db service

//$host   = 'localhost';
//$user   = 'test';
//$pass   = 'test123';
//$dbname = 'demo';
//$port   = '5678'
// The MySQL service named in the docker-compose.yml.
//$host = 'db';

// Database use name
//$user = 'MYSQL_USER';

//database user password
//$pass = 'MYSQL_PASSWORD';

// check the MySQL connection status
//$conn = new mysqli($host, $user, $pass, $dbname, $port);
$conn = new mysqli("mysql.v1", "test", "test123", "demo", "5678");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected to MySQL server successfully!";
}
// select query
$sql = 'SELECT * FROM users';

if ($result = $conn->query($sql)) {
    while ($data = $result->fetch_object()) {
        $users[] = $data;
    }
}

foreach ($users as $user) {
    echo "<br>";
    echo $user->username . " " . $user->password;
    echo "<br>";
}
?>