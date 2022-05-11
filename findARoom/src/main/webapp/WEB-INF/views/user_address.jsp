<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />

<section id="register" class="bg-light py-5">
<div class="overlay"></div>
    
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div class="card">
					<div class="card-header bg-primary text-white">
						<h4>
							<i class="fas fa-user-plus"></i> 
							<c:if  test="${isaBooking eq ture }">Update </c:if>
							User Address
						</h4>
					</div>
					<div class="card-body">
	
				
						<form role="form"
						 action="${pageContext.request.contextPath}/user/address/add"
						 method="post" >
							<!-- <input type="hidden" name="{_csrf.parameterName}"
								value="$_csrf.token}" /> -->

		<!-- 
		<input type="hidden"  name="location" value="${location}">
		 -->
		<input type="hidden"  name="id" value="${address.id}">
		<c:if  test="${isaBooking eq ture }">
		<input type="hidden"  name="booking" value="true">
		</c:if>
						
							<div class="form-group">
								<label for="country">Country</label> 
								<input id="country" name="country" class="form-control"
								value="${address.country}"  placeholder="Enter country">
							</div>


							<div class="form-group">
								<label for="province">Province</label>
								 <input id="province" name="province"
									type="text" placeholder="Enter province" class="form-control"
									value="${address.province}" >
								<p class="help-block">Province name or number</p>
							</div>

							<div class="form-group">
								<label for="city">City</label> 
								<input id="city" name="city"
									type="text" placeholder="Enter city" class="form-control"
									value="${address.city}">
							</div>

							
					<div class="form-group">
								<label for="street">Street</label> 
								<input id="street" name="street"
									type="text" placeholder="Enter street" class="form-control"
									value="${address.street}">
							</div>
							
						
						<div class="form-group">
								<label for="zip">Zip Code</label> 
								<input id="zip" name="zip"
									type="text" placeholder="Enter zip code" class="form-control"
									value="${address.zip}">
							</div>
							
								
							<div class="form-group">
								<label for="check_critiria">Confirmation</label>

								<div class="input-group">
									<span class="input-group-addon"> <input type="checkbox">
									</span> <input id="check_critiria" name="check_critiria"
										class="form-control" type="text"
										placeholder="I declare the information is correct">
								</div>

							</div>



							<div>

								<input type="submit" value="Save" class="btn btn-primary" /> <input
									type="reset" value="Reset" class="btn btn-primary" />
							</div>


						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</section>


<!-- Call to Action -->
<section class="call-to-action text-white text-center">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-9 mx-auto">
				<h2 class="mb-4">Participate in our weakly feature? Subscribe now!</h2>
			</div>
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<form>
					<div class="form-row">
						<div class="col-12 col-md-9 mb-2 mb-md-0">
							<input type="email" class="form-control form-control-lg"
								placeholder="Enter your email...">
						</div>
						<div class="col-12 col-md-3">
							<button type="submit" class="btn btn-block btn-lg btn-primary">Subscribe</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp" />

</html>