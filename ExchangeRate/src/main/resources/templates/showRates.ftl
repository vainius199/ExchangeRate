<!DOCTYPE html>
<html>
    <head>
        <title>Rates List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        	rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        	crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">


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
		    <h2>Exchange List for 1 EUR</h2>
		  </div>
		  <div class="panel-body">

		    <table class="table table-striped">
		      <thead>
		        <tr>
		          <th>Number</th>
		          <th>Currency Name</th>
		          <th>Letter code</th>
		          <th>Exchange Rate</th>
		        </tr>
		      </thead>
		      <tbody>
		       <#list rates as rate>
                <tr>
                      <td>${rate.id}</td>
                    <td><a href="/history/id=${rate.shortName}">${rate.name}</a></td>
                    <td>${rate.shortName}</td>
                    <td>${rate.rate}</td>
                </tr>
           		 </#list>
		      </tbody>
		    </table>
		  </div>
		</div>
		</div>
     </body>
</html>