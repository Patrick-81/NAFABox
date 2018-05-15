<?php 
   $date  = $_POST['date'];
   $command="sudo date -s \"{$date}\"";
   shell_exec($command);
   echo "Date on NAFABox ".$date;
?>
