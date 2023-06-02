<?php
    if ($_GET["func"] == "getT") {
      $temperature = exec("cat /sys/class/thermal/thermal_zone0/temp");
      $temperature = number_format($temperature/1000,1,'.','');
      echo "T CPU : $temperature °C";
    }
    if ($_GET["func"] == "getCPU") {
      $load = sys_getloadavg();
      echo "CPU: " .$load[0]."%";
    }
    if ($_GET["func"] == "getDSK") {
    }
    if ($_GET["func"] == "getRAM") {
       $fh = fopen('/proc/meminfo','r');
       $mem = 0;
       while ($line = fgets($fh)) {
          $pieces = array();
          if (preg_match('/^MemFree:\s+(\d+)\skB$/', $line, $pieces)) {
          $mem = $pieces[1];
          break;
          }
       }
       fclose($fh);
       $mem = number_format($mem/1024/1024,1, '.', '');
       $dsk_free = disk_free_space("/home");
       $dsk_free = number_format($dsk_free/1024/1024/1024,1, '.', '');
       echo "DSK: $dsk_free Gb\nRAM $mem Gb";
     }
?>


