<!DOCTYPE html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>UTILITAIRES NAFAbox</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
        <link rel="stylesheet" href="bootstrap.min.css">    
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
                window.open(window.location.origin+':5899/vnc.html');
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
      <body>
        <div class="container">
          <div class="col">
            <h1>NAFABox - Utilitaires</h1>
          </div>
          
          <div class="row">

            <div class="col-sm text-center align-self-center">
              <h3>Statuts système</h3>
            </div>

            <!-- RAM Block -->
            <div class="col-sm text-center">
 
              <script type="text/javascript">
                $(document).ready(function(){
                    setInterval(
                    function(){
                          $('#RAM').load('getTemp.php?id=123456&func=getRAM');
                    }, 2000);
                });
              </script>
              
              <span><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-memory" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M1 3a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.586a1 1 0 0 0 .707-.293l.353-.353a.5.5 0 0 1 .708 0l.353.353a1 1 0 0 0 .707.293H15a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H1Zm.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 0-.5-.5h-3Zm5 0a.5.5 0 0 0-.5.5v4a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 0-.5-.5h-3Zm4.5.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-4ZM2 10v2H1v-2h1Zm2 0v2H3v-2h1Zm2 0v2H5v-2h1Zm3 0v2H8v-2h1Zm2 0v2h-1v-2h1Zm2 0v2h-1v-2h1Zm2 0v2h-1v-2h1Z"/>
              </svg></span><br/>
              <div>RAM (%) <div id="RAM">70</div></div>
            </div>
            
            <br/><br/>

            <!-- Temperature Block -->
            <div class="col-sm text-center">
              <script type="text/javascript">
                $(document).ready(function(){
                    setInterval(
                    function () {
                          $('#display').load('getTemp.php?id=123456&func=getT');
                    }, 2000);
                });
              </script>
              <span><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-thermometer-half" viewBox="0 0 16 16">
                <path d="M9.5 12.5a1.5 1.5 0 1 1-2-1.415V6.5a.5.5 0 0 1 1 0v4.585a1.5 1.5 0 0 1 1 1.415z"/>
                <path d="M5.5 2.5a2.5 2.5 0 0 1 5 0v7.55a3.5 3.5 0 1 1-5 0V2.5zM8 1a1.5 1.5 0 0 0-1.5 1.5v7.987l-.167.15a2.5 2.5 0 1 0 3.333 0l-.166-.15V2.5A1.5 1.5 0 0 0 8 1z"/>
              </svg></span><br/>
              <div>Temp (°C) <div id="display">70</div></div>  
            </div>

            <br/><br/>

            <!-- CPU Block -->
            <div class="col-sm text-center">
              <script type="text/javascript">
                $(document).ready(function(){
                    setInterval(
                    function () {
                          $('#CPULoad').load('getTemp.php?id=123456&func=getCPU');
                    }, 2000);
                });
              </script>
              <span>
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-cpu-fill" viewBox="0 0 16 16">
                  <path d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
                  <path d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z"/>
                </svg></span><br/>
              <div>CPU Load (%) <div id="CPULoad">50</div></div>

            </div>

          </div><!-- End of the row -->




          <br/><br/>
          <div class="row">
            <div class="col-sm">
              <button type="button" class="btn btn-primary btn-block" onclick="update()">Get actual date</button>
            </div>
            <div class="col-sm">
              <script type="text/javascript">
                document.getElementById("date").value = update();
              </script>

              <form method="post" action='setdate.php'>
                <input class="form-control" name="date" id="date" placeholder="Click on date button">
                <input name="date2send" id="date2send" type="hidden" value="Thu Jun 18 2020 17:20:27 GMT+0200 (heure d’été d’Europe centrale)">
                <script type="text/javascript">
                  document.getElementById("date2send").value = update();
                </script>
            </div>

            <div class="col-sm">
              <button type="submit" class="btn btn-success btn-block">Sent date to NAFABox</button>
            </div>
            </form>
          </div>
          <br/>


              <div class="row">
                <div class="col-sm-8">
                  <button type="button" class="btn btn-primary btn-block" onclick="openindiwebmanager()">Open indiwebmanager</button>
                </div>
                <div class="col-sm-4">
                  <button type="button" class="btn btn-primary btn-block" onclick="openmobindi()">Open mobindi</button>
                </div>
              </div>
              <br/>
              <div class="row">
                <div class="col-sm">
                  <button type="button" class="btn btn-primary btn-block" onclick="openbrowsepy()">Open browsepy</button>
                </div>
                <div class="col-sm">
                  <button type="button" class="btn btn-primary btn-block" onclick="opennovnc()">Open novnc</button>
                </div>
                <div class="col-sm">
                  <button type="button" class="btn btn-primary btn-block" onclick="cockpit()">Open cockpit</button>
                </div>
              </div>

              <br/>
              <form  method="post" action="shutdown_reboot.php">
                <div class="row">
                  <div class="col-sm-8">
                    <button type="submit" class="btn btn-danger btn-block" type="submit" name="action" value="shutdown">Shutdown</button>
                  </div>
                  <div class="col-sm-4">
                    <button type="submit" class="btn btn-warning btn-block" type="submit" name="action" value="reboot">Reboot</button>
                  </div>
                </div>
              </form>
                      
          </div>
          <br/>

          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title">Documentation & Questions</h5>
              <p class="card-text">Click the button below to access the Nafabox documentation. Enjoy.</p>
              <a href="https://github.com/Patrick-81/NAFABox" target="_blank" class="btn btn-primary">Documentation</a>
            </div>
          </div>
        
          </div>
        </div> 
    </body>
  </html>
