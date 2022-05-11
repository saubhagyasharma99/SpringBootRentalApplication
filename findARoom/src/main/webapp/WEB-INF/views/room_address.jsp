<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<i class="fas fa-user-plus"></i> Add Room Address
						</h4>
					</div>
					<div class="card-body">

						<form role="form" action="${pageContext.request.contextPath}/owner/room/address/${aid}"
							method="post" >
							<!-- <input type="hidden" name="{_csrf.parameterName}"
								value="$_csrf.token}" /> -->

		<input type="hidden"  name="location" value=${location}>
						
							<div class="form-group">
								<label for="country">Country</label> 
								<input id="country" name="country" class="form-control" placeholder="Enter country">
							</div>


							<div class="form-group">
								<label for="province">Province</label>
								 <input id="province" name="province"
									type="text" placeholder="Enter province" class="form-control">
								<p class="help-block">Province name or number</p>
							</div>

							<div class="form-group">
								<label for="city">City</label> 
								<input id="city" name="city"
									type="text" placeholder="Enter city" class="form-control">
							</div>

							
					<div class="form-group">
								<label for="street">Street</label> 
								<input id="street" name="street"
									type="text" placeholder="Enter street" class="form-control">
							</div>
							
						
						<div class="form-group">
								<label for="zip">Zip Code</label> 
								<input id="zip" name="zip"
									type="text" placeholder="Enter zip code" class="form-control">
							</div>
							
							<div class="form-group">
								<label for="longitude">Longitude</label> 
								<input id="longitude" name="longitude"
									type="text" placeholder="Enter longitude" class="form-control">
							</div>
							
							<div class="form-group">
								<label for="latitude">Latitude</label> 
								<input id="latitude" name="latitude"
									type="text" placeholder="Enter latitude" class="form-control">
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


<jsp:include page="footer.jsp" />

</html>