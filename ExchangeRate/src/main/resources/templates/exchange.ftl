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
<h1>Currency Exchange</h1>


<div class="container">


	<form method="post" action="/exchange">

	<div class="form-group row">
		<div class="col-xs-4">

		<label for="from_curr">From:</label>
		<select name="currency_from" class="form-control">
		<option value="EUR">Euro</option>
		</select>
	  </div>
	</div>

	<div class="form-group row">
	   <div class="col-xs-4">
		<label for="pwd">To:</label>
            <select  class="form-control"  id="id" name="id" required="required">
                     <#list rates as currency>
                     <option value="${currency.rate}">${currency.name}</option>
                     </#list>
                </select>
		</div>
	</div>



	<div class="form-group row">
	 <div class="col-xs-4">
		<label>Amount :</label>
		<input type="number" min="0" name="amount" id="amount" class="form-control" required>
	  </div>
	 </div>
		<button type="submit" class="btn btn-info" name="convert_currency" >Convert</button>
	</form>
<br><br>


	<label>Currency Rate: </label><br><h2>${rate?ifExists}</h2>
	<label>Amount: </label><br><h2>${amount?ifExists}</h2>







</body>
</html>
