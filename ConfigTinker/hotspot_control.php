<?php 
   $action  = $_POST['action'];
   if ($action == "ON") {
      $command="nmcli connection up hotspot";
      echo "Hotspot ON<br>";
      $output = shell_exec($command);
      echo "$output<br><br>";
   } elseif ($action == "OFF") {
      $command="nmcli connection down hotspot";
      echo "HotSpot OFF<br>";
      $output = shell_exec($command);
      echo "$output<br><br>";
   } elseif ($action == "STAT") {
      $command="nmcli dev wifi show-password";
      $output = shell_exec($command);
      $new_output=nl2br($output);
      echo "$new_output<br>";
   } else {
      echo "Unknown command";
   } 
?>
