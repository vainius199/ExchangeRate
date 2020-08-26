<!DOCTYPE html>
<html>
    <#include "head.ftl">

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