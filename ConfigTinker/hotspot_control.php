<?php 
   $action  = $_POST['action'];
   if ($action == "ON") {
      $command="nmcli connection up hotspot";
      echo "Hotspot ON";
      shell_exec($command);
   } elseif ($action == "OFF") {
      $command="nmcli connection down hotspot";
      echo "HotSpot OFF";
      shell_exec($command);
   } else {
      echo "Unknown command";
   } 
?>
