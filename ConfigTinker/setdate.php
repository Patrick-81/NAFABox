<?php
/*   if ($_POST){
     echo '<pre>';
     echo htmlspecialchars(print_r($_POST, true));
     echo '</pre>';
   }
*/
   $date  = $_POST['date2send'];
   $command="sudo date -s \"{$date}\"";
   shell_exec($command);
   echo "Date on NAFABox ".$date;
?>
