<%@ include file="common/header.jsp"%>
	<div class="card">
		<h2 class="card-header">Please Register Below</h2>
		<div class="card-body">
		<div id="errorMsg" class="alert alert-danger d-none" role="alert">${error}</div>
			<form action="" method="post">
				<div class="mb-3">
					<label for="username" class="form-label">Email address</label> 
					<input type="email" class="form-control" id="${user.username}" aria-describedby="emailHelp" name="username"/>
					<div id="emailHelp" class="form-text">We'll never share your
						email with anyone else.</div>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" id="${user.password}" name="password"/>
				</div>
				
				<div class="mb-3">
					<label for="confirmPassword" class="form-label">Confirm Password</label>
					<input type="password" class="form-control" id="${user.confirmPassword}" name="confirmPassword"/>
				</div>
				
				<button type="submit" class="btn btn-primary">Register</button>
			</form>
		</div>
	</div>
<%@ include file="common/footer.jsp"%>
   <script type="text/javascript">
      $(function () {
        if ($("#errorMsg").text() != "")
      	{
      	  $("#errorMsg").removeClass("d-none");
      	}
      });
    </script>