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
              padding: 1;
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
		    <h2>History for currency rate</h2><br>


		    <form method="post" ">
		     <label><h3>Pick specific date range:</h3></label><br>
		     <ul>
              <label for="birthday">From:</label>
              <input type="date" id="dateFrom" name="dateFrom" required="required">
              <label for="birthday2">To:</label>
              <input type="date" id="dateTo" name="dateTo" required="required">
              <input type="submit">
                </ul>


            </form>
		    <br><br>
		  </div>
		  <div class="panel-body">

		    <table class="table table-striped">
		      <thead>
		        <tr>
		          <th>Number</th>
		           <th>Letter code</th>
		           <th>Exchange Rate</th>
		           <th>Date</th>
		        </tr>
		      </thead>
		      <tbody>
		       <#list history as value>
                 <tr>
                  <td>${value.id}</td>
                  <td>${value.name}</td>
                  <td>${value.rate}</td>
                  <td>${value.date}</td>
                </tr>
               </#list>
		      </tbody>
		    </table>
		  </div>
		</div>
		</div>
     </body>
</html>