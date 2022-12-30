<%@ include file="common/header.jsp"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" defer></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 <style type="text/css">
      .link {
        cursor: pointer;
        color: #007bff;
      }
      .link:hover {
        color: #0056b3;
        text-decoration: underline;
      }
 </style>
 
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
			<div class="alert alert-secondary link"  role="alert" id="dateRange">
			
			  <c:set var = "startDate" value = "${budget.startDate}" />
			   <span class="h5" id="startDate">
			     <fmt:formatDate pattern="MMMM d, yyyy" value="${startDate}" />
			   </span>
			   
			   
			  <c:set var = "endDate" value = "${budget.endDate}" />
			   <span class="h5" id="endDate"> - 
			  <fmt:formatDate pattern="MMMM d, yyyy" value="${endDate}" />
			   </span>
			</div>
		 
		 <div>
		  <c:forEach items="${budget.groups}" var="group">
		    <div class="card" style="margin-bottom: 2em;">
		      <div class="card-header">
		     <c:if test="${empty(group.name)}">
		      <h5> <a href="/budgets/${budget.id}/groups/${group.id}">Unnamed Group </a></h5>
		     </c:if>	
		     <c:if test="${not empty(group.name)}">
		      <h5><a href="/budgets/${budget.id}/groups/${group.id}">${group.name}</a></h5>
		     </c:if>
		    </div>
		    
		    <div class="card-body">
		      <div>
		       <c:forEach items="${group.categories}" var="category">
		          <div>
		         <a href="/budgets/${budget.id}/groups/${group.id}/categories/${category.id}">${category.name}</a>
		          </div>
		        </c:forEach>
		      </div>
		       <form style="margin-top: 1.5em;" action="/budgets/${budget.id}/groups/${group.id}/categories" method="post">
		         <button type="submit" class="btn btn-primary" id="|createcategory-${group.id}">Create New Category</button>
		      </form>
		    </div>
		    
		    
		    </div>
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
 
<script type="text/javascript">
$(function () {
	$('#dateRange').daterangepicker({
	
	},function (start, end, label) {
      console.log("A new date selection was made: " + start.format('MMMM D, YYYY') + ' to ' + end.format('MMMM D, YYYY'));
	  $.ajax({
		url: '',
		data: {
			"startDate" : start.format('YYYY-MM-DD'),
			  "endDate" : end.format('YYYY-MM-DD')
		},
		type: 'json',
		method: 'put',
		success: function () {
			  $("#startDate").text(start.format('MMMM D, YYYY') + " - ");
		      $("#endDate").text(end.format('MMMM D, YYYY'))
		},
		error : function (error) {
	      console.log(error);
		}
	  })
		
	});
  });
</script>
 
 
 
 
 