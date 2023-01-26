<%@ include file="common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<style scoped>
.no-underline a {
	text-decoration: none;
}
</style>

<script type="text/javascript">
	var budgetId=0
	budgetId = ${group.budget.id}
	var categoryId=0
	categoryId = ${category.id}
	var groupId = 0
	groupId= ${group.id}
	
	$(function() {
		 $("tr[id*='transaction-']").click(function() {
				   var transactionId = $(this).prop('id').split('-')[1];
				   window.location.href = '/budgets/' + budgetId + '/groups/' + groupId + '/categories/' + categoryId + '/transactions/'+ transactionId;
				});
		 
		 $("#addTransaction").click(function(){
			 $("#addTransactionForm").submit();
		 });
	});
</script>

<div class="card">
	<div class="card-header">
		<div class="row">
		   <div class="col-10 col-md-11">
		    <nav aria-label="breadcrumb">
				<ol class="breadcrumb h3">
					<li class="breadcrumb-item"><a href="/budgets">Budgets</a></li>
					<li class="breadcrumb-item"><a href="/budgets/${group.budget.id}">${group.budget.name}</a></li>
					<li class="breadcrumb-item"><a href="/budgets/${group.budget.id}/groups/${group.id} /"> 
					<c:out value="${fn.length(group.name)==null ? 'New Group' : group.name}" />
					</a></li>
					<li class="breadcrumb-item active" aria-current="page">${category.name}</li>
				</ol>
			</nav>
			<div>
			<div class="col-2 col-md-1">
			   <form id="addTransactionForm" action="/budgets/${group.budget.id}/groups/${group.id}/categories/${category.id}/transactions" method="post">
              <i id="addTransaction" class="fa-solid fa-plus fa-2x" aria-hidden="true"></i>
            </form> 
			</div>	
		   </div>
		 </div>
		   
		</div>
	</div>



	<div class="card-body">
		<form method="post" action="">
			<input type="hidden" name="id" value="${category.id}" />

			<!-- Category Name -->
			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label form-control-lg">Name:
				</label>
				<div class="col-sm-10">
					<input type="text" class="form-control form-control-lg"
						value="${category.name}" name="name" placeholder="Dining Out" />
				</div>
			</div>

			<!-- Category Budget Amount -->
			<div class="form-group row">
				<div class="input-group mb-3">
					<label for="budget" class="col-sm-2 col-form-label form-control-lg">Budget
						Amount: </label> <span class="input-group-text">$</span> <input
						type="number" step=".01" class="form-control form-control-lg"
						value="${category.budget}" name="budget" placeholder="100.00" />
				</div>

			</div>

			<button type="submit" class="btn btn-primary btn-lg">Save</button>
		</form>


		<div class="card" style="margin-top: 0.25em">
			<div class="card-header">
				<strong>Transactions </strong>
				<p>
				<fmt:parseDate value="${category.group.budget.startDate}" pattern="yyyy-MM-dd" var="parseStartDate"/>
				<c:set var = "startDate" value = "${parseStartDate}" />
			      <span id="startDate">
			        <fmt:formatDate pattern="MMMM d, yyyy" value="${startDate}" />
			      </span>
			     <fmt:parseDate value="${category.group.budget.endDate}" pattern="yyyy-MM-dd" var="parseEndDate"/>
			    <c:set var = "endDate" value = "${parseEndDate}" />
			      <span id="endDate"> - 
			       <fmt:formatDate pattern="MMMM d, yyyy" value="${endDate}" />
			      </span>
			   </p>
			</div>
			<div class="card-body">

				<table class="table table-striped">

					<thead>
						<tr>
							<th scope="col">Date</th>
							<th scope="col">Category</th>
							<th scope="col">Amount</th>
							<th scope="col">Notes</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${filteredTxn}" var="transaction">
							<tr style="cursor: pointer;" id="transaction-${transaction.id}">
								<td>
								<fmt:parseDate value="${transaction.date}" type="date" pattern="yyyy-MM-dd" var="parsedDate" /> 
								<fmt:formatDate type="date" pattern="MMM-dd" value="${parsedDate}" />
								</td>
								<td>${category.name}</td>
								<td>
								  <c:choose>
                                       <c:when test="${transaction.total == NULL}">
                                        <fmt:formatNumber type="currency" value="0" maxFractionDigits = "3" />
								       </c:when>
								       <c:otherwise>
								       <fmt:formatNumber type="currency" value="${transaction.total}" maxFractionDigits = "3" />
								       </c:otherwise>
								  </c:choose>
								</td>
								<td>${transaction.note}</td>

							</tr>
						</c:forEach>

					</tbody>

				</table>
			</div>
		</div>

	</div>
</div>
<%@ include file="common/footer.jsp"%>