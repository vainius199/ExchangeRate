<!DOCTYPE html>
<html>
    <head>
        <title>Home page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        	rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        	crossorigin="anonymous">

        	<style>
                ul {
                  list-style-type: none;
                  margin: 0;
                  padding: 0;
                  overflow: hidden;
                  background-color: #dddddd;
                }

                li {
                  float: left;
                }

                li a {
                  display: block;
                  padding: 8px;
                }
                </style>

               <ul>
                             <li><a href="/">Home</a></li>
                             <li><a href="/showRates">Exchange rates</a></li>
                             <li><a href="/exchange">Currency converter</a></li>
                           </ul>

    </head>

    <body>
    <div class="container">
	     <div class="panel panel-primary">
			  <div class="panel-heading">
			    <h2>Home Page</h2>
			  </div>
	        <a href="showRates">Show ExchangeRates </a>
	        <br>
	          <a href="exchange">Calculate Exchange</a>

	        </div>
        </div>
    </body>

</html>