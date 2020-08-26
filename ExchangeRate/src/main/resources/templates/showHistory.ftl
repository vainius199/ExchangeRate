<!DOCTYPE html>
<html>
    <#include "head.ftl">


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