<?php 
   $action  = $_POST['action'];
   if ($action == "shutdown") {
      $command="sudo shutdown now";
      echo "Shutdown Now";
      shell_exec($command);
   } elseif ($action == "reboot") {
      $command="sudo reboot";
      echo "Reboot";
      shell_exec($command);
   } else {
      echo "Unknown command";
   } 
?>
