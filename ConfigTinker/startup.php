<!DOCTYPE html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>NAFAbox Tools</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link id="stylepage" href="dark.css" rel="stylesheet">
        
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
            function openals() {
                window.open(window.location.origin+':8000');
            }
            function cockpit() {
                window.open(window.location.origin+':9090');
            }
            function setDarkTheme(){
                console.log('OK dark');
                var css_filename = "dark.css";
                $("#stylepage")[0].setAttribute("href", css_filename)
            }
            function setLightTheme(){
                console.log('OK light');
                var css_filename = "light.css";
                $("#stylepage")[0].setAttribute("href", css_filename)
        
            }
            function setHotSpotON(){
                console.log('HotSpot ON');
            }
            function setHotSpotOFF(){
                console.log('HotSpot OFF');
            }
        </script>
    </head>
    <body>
        <div class="container">
            <!-- Image and text -->
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand d-flex h-100 justify-content-center align-items-center" href="#">
                    <img src="logo_256.png" width="96" height="96" class="d-inline-block align-top" alt="">
                    <span class="h2 p-2"> NAFABox Tools</span>
                </a>
            </nav>
            <br/><br/>

            <div class="row">

                <div class="col-sm text-center align-self-center ">
                    <div class="row d-flex h-100 justify-content-center align-items-center">
                        <h3>Theme light</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm text-center align-self-center">
                            <button type="button" class="btn btn-sm btn-secondary btn-block" onclick="setLightTheme()()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brightness-high-fill" viewBox="0 0 16 16">
                                <path d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                            </svg></button>
                        </div>
                        <div class="col-sm text-center align-self-center">
                            <button type="button" class="btn btn-sm btn-secondary btn-block" onclick="setDarkTheme()()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-moon-fill" viewBox="0 0 16 16">
                                <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
                            </svg></button>
                        </div>
                    </div>
                    <br/>
                    <form  method="post" action="hotspot_control.php">
                    <div class="row d-flex h-100 justify-content-center align-items-center">
                        <h3>Hotspot Control</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm text-center align-self-center">
                            <button type="submit" class="btn btn-success btn-block" type="submit" name="action" value="ON">ON</button>
                        </div>
                        <div class="col-sm text-center align-self-center">
                            <button type="submit" class="btn btn-danger btn-block" type="submit" name="action" value="OFF">OFF</button>
                        </div>
                    </div>
                    </from>

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
                    </svg></span>
                    <br/>
                    <div>RAM<div id="RAM">70</div></div>
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
                    </svg></span>
                    <br/>
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
                    <span><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-cpu-fill" viewBox="0 0 16 16">
                        <path d="M6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
                        <path d="M5.5.5a.5.5 0 0 0-1 0V2A2.5 2.5 0 0 0 2 4.5H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2v1H.5a.5.5 0 0 0 0 1H2A2.5 2.5 0 0 0 4.5 14v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14h1v1.5a.5.5 0 0 0 1 0V14a2.5 2.5 0 0 0 2.5-2.5h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14v-1h1.5a.5.5 0 0 0 0-1H14A2.5 2.5 0 0 0 11.5 2V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5a.5.5 0 0 0-1 0V2h-1V.5zm1 4.5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3A1.5 1.5 0 0 1 6.5 5z"/>
                    </svg></span>
                    <br/>
                    <div>CPU Charge (0-1)<div id="CPULoad">50</div></div>
                </div>
                <!-- NET Block -->
                <div class="col-sm text-center">
                    <script type="text/javascript">
                        $(document).ready(function(){
                            setInterval(
                            function () {
                                $('#NETadd').load('getTemp.php?id=123456&func=getNET');
                            }, 2000);
                        });
                    </script>
                    <span><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-net-fill" viewBox="0 0 24 24">
                        <path d="M3 12H21M12 8V12M6.5 12V16M17.5 12V16M10.1 8H13.9C14.4601 8 14.7401 8 14.954 7.89101C15.1422 7.79513 15.2951 7.64215 15.391 7.45399C15.5 7.24008 15.5 6.96005 15.5 6.4V4.6C15.5 4.03995 15.5 3.75992 15.391 3.54601C15.2951 3.35785 15.1422 3.20487 14.954 3.10899C14.7401 3 14.4601 3 13.9 3H10.1C9.53995 3 9.25992 3 9.04601 3.10899C8.85785 3.20487 8.70487 3.35785 8.60899 3.54601C8.5 3.75992 8.5 4.03995 8.5 4.6V6.4C8.5 6.96005 8.5 7.24008 8.60899 7.45399C8.70487 7.64215 8.85785 7.79513 9.04601 7.89101C9.25992 8 9.53995 8 10.1 8ZM15.6 21H19.4C19.9601 21 20.2401 21 20.454 20.891C20.6422 20.7951 20.7951 20.6422 20.891 20.454C21 20.2401 21 19.9601 21 19.4V17.6C21 17.0399 21 16.7599 20.891 16.546C20.7951 16.3578 20.6422 16.2049 20.454 16.109C20.2401 16 19.9601 16 19.4 16H15.6C15.0399 16 14.7599 16 14.546 16.109C14.3578 16.2049 14.2049 16.3578 14.109 16.546C14 16.7599 14 17.0399 14 17.6V19.4C14 19.9601 14 20.2401 14.109 20.454C14.2049 20.6422 14.3578 20.7951 14.546 20.891C14.7599 21 15.0399 21 15.6 21ZM4.6 21H8.4C8.96005 21 9.24008 21 9.45399 20.891C9.64215 20.7951 9.79513 20.6422 9.89101 20.454C10 20.2401 10 19.9601 10 19.4V17.6C10 17.0399 10 16.7599 9.89101 16.546C9.79513 16.3578 9.64215 16.2049 9.45399 16.109C9.24008 16 8.96005 16 8.4 16H4.6C4.03995 16 3.75992 16 3.54601 16.109C3.35785 16.2049 3.20487 16.3578 3.10899 16.546C3 16.7599 3 17.0399 3 17.6V19.4C3 19.9601 3 20.2401 3.10899 20.454C3.20487 20.6422 3.35785 20.7951 3.54601 20.891C3.75992 21 4.03995 21 4.6 21Z"/>
                    </svg></span>
                    <br/>
                    <div>NET adress :<div id="NETadd">0.0.0.0</div></div>
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
                <div class="col-sm">
                    <button type="button" class="btn btn-primary btn-block" onclick="openindiwebmanager()">Open indiwebmanager</button>
                </div>
                <div class="col-sm">
                    <button type="button" class="btn btn-primary btn-block" onclick="openmobindi()">Open mobindi</button>
                </div>
                <div class="col-sm">
                    <button type="button" class="btn btn-primary btn-block" onclick="openals()">Open ALS</button>
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
                <br/><br/>

                <em style="font-size: 1em;">NAFABox</em>
                <br/>

                <em style="font-size: 0.8em;">Authors Dragonlost & Pat81 -  Design M. Le Lain</em>
            </div>
        </div>
    </body>
</html>
