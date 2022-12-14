<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
 $(function(){
	$("#registerBtn").click(function(){		
		window.location.href = '/register';	
   }); 
 });
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="card">
		<h2 class="card-header">Please Login Below</h2>
		<div class="card-body">
				<form action="" method="post">
					
					<!-- use param.error assuming FormLoginConfigurer#failureUrl contains the query parameter error -->
						<c:if test="${param.error != null}">
							<div>
								Failed to login.
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                  Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:if>
							</div>
						</c:if>
						<!-- the configured LogoutConfigurer#logoutSuccessUrl is /login?logout and contains the query param logout -->
						<c:if test="${param.logout != null}">
							<div>You have been logged out.</div>
						</c:if>
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> 
							<input type="text" class="form-control" id="${user.username}" name="username" />
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> 
							<input type="password" class="form-control" id="${user.password}" name="password" />
						</div>
						<!-- if using RememberMeConfigurer make sure remember-me matches RememberMeConfigurer#rememberMeParameter -->
						<p>
							<label for="remember-me">Remember Me?</label> <input
								type="checkbox" id="remember-me" name="remember-me" />
						</p>
						<div>
							<button type="submit" class="btn-success">Log in</button>
							<button id="registerBtn" type="button" class="btn btn-primary">Register</button>
						</div>
				</form>
	</div>
	</div>
</body>
</html>