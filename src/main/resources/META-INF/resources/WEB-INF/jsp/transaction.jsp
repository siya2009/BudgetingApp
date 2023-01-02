<%@ include file="common/header.jsp"%>
	<div class="card">
      <div class="card-header">
        <div class="row">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb h3">
              <li class="breadcrumb-item"><a href="/budgets">Budgets</a></li>
              <li class="breadcrumb-item"> <a href="/budgets/${budget.id}">${budget.name}</a></li>
              <li class="breadcrumb-item active" aria-current="page">New Transaction</li>
            </ol>
          </nav>
        </div>
      </div>
 
      
      
		<div class="card-body">
		 <form method="post" action="">
		   <input type="hidden" name="id" value="${transaction.id}"/>
		   <input type="hidden" name="budget" value="${transaction.budget.id}"/>
		   
		   <!-- Transaction Date -->
          <div class="form-group row">
            <label for="date" class="col-sm-2 col-form-label form-control-lg">Transaction Date: </label>
            <div class="col-sm-10">
              <input type="date" class="form-control form-control-lg" value="${transaction.date}" name="date" placeholder="2023-01-01"/>
            </div>
          </div>
          
           <!-- Transaction Budget Amount -->
           <div class="form-group row">
           <div class="input-group mb-3">
            <label for="total" class="col-sm-2 col-form-label form-control-lg">Transaction Amount: </label>
             <span class="input-group-text">$</span>
             <input type="number" step=".01" class="form-control form-control-lg" value="${transaction.total}" name="total" placeholder="100.00"/>
           </div>
           
              <!-- Transaction Note -->
          <div class="form-group row">
            <label for="notes" class="col-sm-2 col-form-label form-control-lg">Notes:</label>
            <div class="col-sm-10">
              <textarea maxlength="255" class="form-control form-control-lg" name="note" placeholder="(optional)" required="${transaction.note}" ></textarea>
            </div>
          </div>
           
          </div>
          
          <button type="submit" class="btn btn-primary btn-lg">Save</button>
        </form>
		</div>
	</div>
 <%@ include file="common/footer.jsp"%>