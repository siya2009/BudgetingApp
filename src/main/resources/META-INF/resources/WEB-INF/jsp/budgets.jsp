<%@ include file="common/header.jsp"%>
	<div class="card">
		<div class="card-header">
			<div class="row">
				<div class="h2 col-10">Your Budgets</div>
				<div class="col-2">
					<i id="addBudget"class="fa-solid fa-plus fa-2x" aria-hidden="true"></i>
				</div>
			</div>
		</div>
		<div class="list-group list-group-flush">
		 <c:forEach items="${budgets}" var="budget">
		 	<a href="/budgets/${budget.id}" class="list-group-item list-group-item-action">${budget.name}</a>
		</c:forEach>
		</div>
	</div>
 <%@ include file="common/footer.jsp"%>
 <script type="text/javascript">
      $(function () {
        $("#addBudget").click(function () {
          $.ajax({
        	  url: '/budgets',
        	  method: 'post',
        	  dataType: 'json',
        	  success : function (data) {
        		console.log(data);
        		location.reload();
        	  },
        	  error : function () {
        		console.log("There was an error creating a new budget");  
        	  }
          });
        });
      });
 </script>