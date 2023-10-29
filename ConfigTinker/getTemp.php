<?php
    if ($_GET["func"] == "getT") {
      $command="(sensors | awk -v RS='' '{print $1 FS $6}'| sed 's/cpu_thermal-virtual-0/CPU_TEMP/g' | sed 's/rpi_volt-isa-0000/RPI_Voltage/g')";
      $output=shell_exec($command);
      $new_output=nl2br($output);
      echo "$new_output";
    }
    if ($_GET["func"] == "getCPU") {
      $output=shell_exec("(python3 /home/USER/bin/cpu_load.py)");
      $new_output=nl2br($output);
      echo "$new_output";
    }
    if ($_GET["func"] == "getNET") {
      $output=shell_exec("(ifconfig  | awk -v RS='' '{print $1 FS $6}')");
      $new_output=nl2br($output);
      echo "$new_output";
      $output=shell_exec("curl ifconfig.me");
      echo "Internet : $output<br>";
    }
    if ($_GET["func"] == "getRAM") {
       $av_mem=shell_exec("(free -m | awk 'FNR == 2 {print $3}')");
       $total_mem=shell_exec("(free -m | awk 'FNR == 2 {print $2}')");
       $DISK_SIZE_TOTAL=shell_exec("(df -kh . | tail -n1 | awk '{print $2}')");
       $DISK_SIZE_FREE=shell_exec("(df -kh . | tail -n1 | awk '{print $4}')");
       $DISK_PERCENT_USED=shell_exec("(df -kh . | tail -n1 | awk '{print $5}')");
       echo "Disk Free: $DISK_SIZE_FREE/$DISK_SIZE_TOTAL<br>$DISK_PERCENT_USED Disk Used<br>";
       echo "RAM : $av_mem/$total_mem Mb";
     }
?>

