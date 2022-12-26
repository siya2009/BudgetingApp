<%@ include file="common/header.jsp"%>
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
		     <c:if test="${empty(group.name)}">
		      <h5> <a href="/budgets/${budget.id}/groups/${group.id}">Unnamed Group </a></h5>
		     </c:if>	
		     
		     <c:if test="${not empty(group.name)}">
		      <h5><a href="/budgets/${budget.id}/groups/${group.id}">${group.name}</a></h5>
		     </c:if>
		     
		  </c:forEach>
		 </div>
		 
		 <div class="row" style="margin-top: 2em;">
		 	<div class="col">
		 	  <form action="/budgets/${budget.id}/groups" method="post">
		 	 <button type="submit" class="btn btn-primary">Create Group</button>
		 	 </form>
		 	</div>
		 </div>
		 
		</div>
	</div>
 <%@ include file="common/footer.jsp"%>