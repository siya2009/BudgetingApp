<%@ include file="common/header.jsp"%>
	<div class="card">
      <div class="card-header">
        <div class="row">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb h3">
              <li class="breadcrumb-item"><a href="/budgets">Budgets</a></li>
              <li class="breadcrumb-item"> <a href="/budgets/${group.budget.id}">${group.budget.name}</a></li>
               <li class="breadcrumb-item">
               <a href="/budgets/${group.budget.id}/groups/${group.id}/">
                 <c:out value="${fn.length(group.name)==null ? 'New Group' : group.name}"> </c:out>
               </a>
              </li>
              <li class="breadcrumb-item active" aria-current="page"> ${category.name} </li>
            </ol>
          </nav>
        </div>
      </div>
 
      
      
		<div class="card-body">
		 <form method="post" action="">
		   <input type="hidden" name="id" value="${category.id}"/>
		   
		   <!-- Category Name -->
          <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label form-control-lg">Name: </label>
            <div class="col-sm-10">
              <input type="text" class="form-control form-control-lg" value="${category.name}" name="name" placeholder="Dining Out"/>
            </div>
          </div>
          
           <!-- Category Budget Amount -->
           <div class="form-group row">
           <div class="input-group mb-3">
            <label for="budget" class="col-sm-2 col-form-label form-control-lg">Budget Amount: </label>
             <span class="input-group-text">$</span>
             <input type="number" step=".01" class="form-control form-control-lg" value="${category.budget}" name="budget" placeholder="100.00"/>
           </div>
           
          </div>
          
          <button type="submit" class="btn btn-primary btn-lg">Save</button>
        </form>
		</div>
	</div>
 <%@ include file="common/footer.jsp"%>