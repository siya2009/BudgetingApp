<%@ include file="common/header.jsp"%>
	<div class="card">
      <div class="card-header">
        <div class="row">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb h3">
              <li class="breadcrumb-item"><a href="/budgets">Budgets</a></li>
              <li class="breadcrumb-item" aria-current="page"> <a href="/budgets/${group.budget.id}">${group.budget.name}</a></li>
               <li class="breadcrumb-item active" aria-current="page">
               <c:out value="${fn.length(group.name)==null ? 'New Group' : group.name}" />
              </li>
            </ol>
          </nav>
        </div>
      </div>
		<div class="card-body">
		 <form method="post" action="">
          <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label form-control-lg">Name: </label>
            <div class="col-sm-10">
              <input type="text" class="form-control form-control-lg" value="${group.name}" name="name" placeholder="Group Name"/>
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-lg">Save</button>
        </form>
		</div>
	</div>
 <%@ include file="common/footer.jsp"%>