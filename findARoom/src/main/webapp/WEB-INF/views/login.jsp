<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" ></jsp:include>
<!-- Icons Grid -->

<!-- Masthead -->
<header class="masthead text-white text-center">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-9 mx-auto">
				<h1 class="mb-5">Browse search and discover your own place!</h1>
			</div>
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<form action="${pageContext.request.contextPath}/login"
					method="post">
					<div class="form-row">
						<div class="col-12 col-md-9 mb-2 mb-md-0 ">
							<input type="text" class="form-control form-control-lg"
								name="username" placeholder="Enter your email">
						</div>
						<div class="col-12 col-md-9 mb-2 mb-md-0 ">
							<br />
						</div>
						<div class="col-12 col-md-9 mb-2 mb-md-0 ">
							<input type="password" class="form-control form-control-lg"
								name="password" placeholder="Enter your password">
						</div>
					</div>
					<div class="form-row">
						<div class="col-12 col-md-9 mb-2 mb-md-0 ">
							<br />
						</div>
					</div>
					<div class="form-row">
						<div class="col-12 col-md-3 mb-2  mb-md-0">
							<button type="submit" class="btn btn-block btn-lg btn-primary">Sign
								in!</button>
						</div>
						<br>
					
					
					</div>
						<p style="color:red">Forgot Password? Reset</p>
				</form>
			</div>
	</div>
	</div>
	</header>

	<jsp:include page="footer.jsp"></jsp:include>
	</html>
	