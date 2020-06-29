<!DOCTYPE html>
<html><head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type">
    <title>UTILITAIRES NAFAbox</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/
libs/jquery/1.3.0/jquery.min.js"></script>    
    <script type="text/javascript">
	  var a = update();
    function update() {
      var d = new Date();
      var utc=d.toString();
      console.log(utc)
      document.getElementById("date").value = utc;
      return utc;
    }
	function openbrowsepy() {
   		window.open(window.location.origin+':8180');
	}
	function opennovnc() {
   		window.open(window.location.origin+':5901/vnc.html');
	}
	function openindiwebmanager() {
   		window.open(window.location.origin+':8624');
	}
	function openmobindi() {
   		window.open(window.location.origin+':8080');
	}
	function cockpit() {
   		window.open(window.location.origin+':9090');
	}
 </script>
  </head>
  <body style="   width: 600px;/*! border-top-width: 1px; *//*! border-top-style: solid; *//*! border-bottom-width: 1px; *//*! border-bottom-style: solid; *//*! border-left-width: 1px; *//*! border-left-style: solid; *//*! border-right-width: 1px; *//*! border-right-style: solid; */"> <br>
    <table style="width: 600px; text-align: left; margin-left: auto; margin-right: auto; height: 120px;width: 200px;width: auto;border-top-width: 1px;border-top-style: solid;border-bottom-width: 1px;border-bottom-style: solid;border-left-width: 1px;border-left-style: solid;border-right-width: 1px;border-right-style: solid;" border="0">
      <tbody>
        
          <tr style="height: auto;"><td style="text-align: center;width: 200px;"><br>
          </td>
          <td style="text-align: center; height: auto; width: inherit;"> 
  UTILITAIRES NAFABox<br>
          </td>
          <td style="width: inherit;">

            
          </td>
        </tr>
          <tr style="height: auto;"><td style="text-align: center;width: 200px;">
          <br>
          </td>
          <td style="text-align: center; height: auto; width: inherit;">Statut systeme<br>
          </td>
          <td style="width: inherit;">
          </td>
          </tr>
          <tr><td style="text-align: center;width: 200px;">
          <script type="text/javascript">
            $(document).ready( function(){
                       $('#RAM').load('getTemp.php?id=123456&func=getRAM');
            });
          </script>
          <div id="RAM"></div>
          <br>
          </td>
          <td style="text-align: center; height: 30px; width: inherit;">
          <script type="text/javascript">
            $(document).ready(function(){
                 setInterval(
                 function () {
                       $('#display').load('getTemp.php?id=123456&func=getT');
                 }, 2000);
             });
          </script>
          <div id="display"></div>          
          <br>
          </td>
          <td style="width: inherit;">
          <script type="text/javascript">
            $(document).ready(function(){
                 setInterval(
                 function () {
                       $('#CPULoad').load('getTemp.php?id=123456&func=getCPU');
                 }, 2000);
             });
          </script>
          <div id="CPULoad"></div>
          <br>
          </td>
          </tr>
        <tr style="border-top-width: 0px;border-top-style: solid;border-bottom-width: 0px;border-bottom-style: solid;">
          <td style="text-align: center;width: 200px;"><button type="button" style="color:blue;background:#DFDFDF" name="Actuate" onclick="update()">ACTUATE</button><br>
          </td>
          <td style="text-align: center; height: 30px; width: inherit;"> <textarea placeholder="date" cols="40" name="date" id="date" maxlength="50" rows="2" style="width: inherit;align-content: center;">Thu Jun 18 2020 17:20:27 GMT+0200 (heure d’été d’Europe centrale)</textarea><br>
          </td>
          <td style="width: inherit;">
            <div style="text-align: center;width: inherit;">
              <form method="post" action="setdate.php" style="width: inherit;">
                <input name="date2send" id="date2send" type="hidden" value="Thu Jun 18 2020 17:20:27 GMT+0200 (heure d’été d’Europe centrale)">
                <script type="text/javascript">
                    document.getElementById("date2send").value = update();
                </script>
                <input type="submit" style="color:red;background:#DFDFDF;width: inherit;" value=">> PC/ÂµBOARD >>">
               </form>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align: center;width: inherit;"> <button style="color:blue;background:#DFDFDF" onclick="openbrowsepy()">BROWSEPY</button><br>
          </td>
          <td style="text-align: center;width: auto;"> <button style="color:blue;background:#DFDFDF" onclick="opennovnc()">OUVRIR NOVNC</button><br>
          </td>
          <td style="width: inherit;"><button style="color:blue;background:#DFDFDF;width: inherit;" onclick="openindiwebmanager()">INDIWEBMANAGER </button><br>
          </td>
        </tr>
        <tr>
          <td style="text-align: center;width: inherit;"><button style="color:blue;background:#DFDFDF" onclick="openmobindi()">MOBINDI</button><br>
          </td>
          <td style="text-align: center;width: auto;"><button style="color:blue;background:#DFDFDF" onclick="cockpit()">COCKPIT</button><br>
          </td>
          <td style="width: auto;"><br>
          </td>
        </tr>
        <tr>
          <td style="width: auto;"> <br>
          </td>
          <td style="width: auto;"><br>
          </td>
          <td style="width: auto;"><br>
          </td>
        </tr>
        <tr style="border-top-width: 2px;border-top-style: solid;border-bottom-width: 2px;border-bottom-style: solid;">
          <td style="width: auto;">
            <div style="text-align: center">
              <div style="text-align: inherit;">
                <form method="post" action="shutdown_reboot.php"> <input style="color:blue;background:#DFDFDF" name="action" value="shutdown" type="submit"> </form>
              </div>
            </div>
          </td>
          <td style="width: auto;"><br>
          </td>
          <td style="width: auto;">
            <div style="text-align: center">
              <div style="text-align: inherit;">
                <form method="post" action="shutdown_reboot.php"> <input style="color:blue;background:#DFDFDF" name="action" value="reboot" type="submit"> </form>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    
    
  

</body></html>
