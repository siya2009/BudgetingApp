<%@ include file="common/header.jsp"%>
	<div class="card">
		 <div class="card">
      <div class="card-header">
        <div class="row">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb h3">
              <li class="breadcrumb-item"><a href="/budgets">Budgets</a></li>
              <li class="breadcrumb-item active" aria-current="page">${budget.name}</li>
            </ol>
          </nav>
        </div>
      </div>
		<div class="card-body">
		 <div>
		  <c:forEach items="${budget.groups}" var="group">
		    <h4>${group.name}</h4>
		  </c:forEach>
		 </div>
		</div>
	</div>
	</div>
 <%@ include file="common/footer.jsp"%>