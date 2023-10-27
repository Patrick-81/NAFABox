<?php
    if ($_GET["func"] == "getT") {
      $temperature = exec("cat /sys/class/thermal/thermal_zone0/temp");
      $temperature = number_format($temperature/1000,1,'.','');
      echo "T CPU : $temperature °C";
    }
    if ($_GET["func"] == "getCPU") {
      $output=shell_exec("cat /proc/loadavg");
      $loadavg=substr($output,0,strpos($output," "));
      $loadavg=$loadavg*1;
      echo "CPU: " .$loadavg;
    }
    if ($_GET["func"] == "getNET") {
      $output=shell_exec("(ifconfig | awk -v RS='' '{print $6')");
      echo "$output<br>";
      $output=shell_exec("curl ifconfig.me");
      echo "$output<br>";
    }
    if ($_GET["func"] == "getRAM") {
       $fh = fopen('/proc/meminfo','r');
       $mem = 0;
       while ($line = fgets($fh)) {
          $pieces = array();
          if (preg_match('/^MemAvailable:\s+(\d+)\skB$/', $line, $pieces)) {
          $mem = $pieces[1];
          break;
          }
       }
       fclose($fh);
       $mem = number_format($mem/1024/1024,1, '.', '');
       $dsk_free = disk_free_space("/home");
       $dsk_free = number_format($dsk_free/1024/1024/1024,1, '.', '');
       echo "Disk Free: $dsk_free<br>";
       echo "RAM Free: $mem Gb";
     }
?>


