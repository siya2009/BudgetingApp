<%@ include file="common/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	$(function() {
		 $("tr[id*='transaction-']").click(function() {
				   var transactionId = $(this).prop('id').split('-')[1];
				   window.location.href = '/budgets/' + budgetId + '/categories/' + categoryId + '/transactions/'+ transactionId;
				});
	});
</script>

<div class="card">
	<div class="card-header">
		<div class="row">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb h3">
					<li class="breadcrumb-item"><a href="/budgets">Budgets</a></li>
					<li class="breadcrumb-item"><a
						href="/budgets/${group.budget.id}">${group.budget.name}</a></li>
					<li class="breadcrumb-item"><a
						href="/budgets/${group.budget.id}/groups/${group.id}/"> <c:out
								value="${fn.length(group.name)==null ? 'New Group' : group.name}">
							</c:out>
					</a></li>
					<li class="breadcrumb-item active" aria-current="page">
						${category.name}</li>
				</ol>
			</nav>
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
				<strong>Transactions</strong>
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
						<c:forEach items="${category.transactions}" var="transaction">
							<tr style="cursor: pointer;" id="transaction-${transaction.id}">
								<td>
								<fmt:parseDate value="${transaction.date}" type="date" pattern="yyyy-MM-dd" var="parsedDate" /> 
								<fmt:formatDate type="date" pattern="MMM-dd" value="${parsedDate}" />
								</td>
								<td>${category.name}</td>
								<td>${transaction.total}</td>
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