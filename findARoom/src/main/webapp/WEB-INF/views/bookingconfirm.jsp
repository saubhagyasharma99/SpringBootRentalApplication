<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />
<!-- Icons Grid -->
<!-- Image Showcases -->
<section class="showcase">
	<div class="container-fluid p-0">

		<div class="row">
			<div class="col-lg-9 text-white showcase-img"
				style="background-image: url('img/bg-showcase-2.jpg');"></div>
		</div>
		<div class="row">
			<div class="col showcase-text">
				<div class="card">
					<div class="card-header bg-info text-white">
						<h4>
							<i class="fas fa-user-plus"></i> Room Details
						</h4>
					</div>
					<div class="card-body">

				
								<label >Room ID</label> 
								<p>${roomInfo.id }</p>
								<hr>
							
								<label for="type">Room Type</label> 
								<p>${roomInfo.type }</p>
							<hr>
								<label for="area">Area</label> 
								<p>${roomInfo.area }</p>
								<p class="help-block">Area in square feet</p>
							<hr>
								<label for="price">Price</label> 
								<p>${roomInfo.price }</p>
							<hr>
							
								<label for="description">Description</label>
								<p>${roomInfo.description }</p>
							<hr>

								<label for="location">Location</label> 
									<p>${roomInfo.address.city }</p>
							<hr>

								<label for="available">Available</label> 
								<p>
									<c:if test="${roomInfo.status eq 1}">Available</c:if> 
									<c:if test="${roomInfo.status ne 0}">Unavailable</c:if>
									</p>
							<hr>

								<label for="Parking">Parking</label> 
								<p>
										<c:if test="${roomInfo.parking eq false }">NO</c:if>
										<c:if test="${roomInfo.parking eq true }">YES</c:if>
									</p>
								<hr>


								<label for="Water">Water</label>
								<p>
									<c:if test="${roomInfo.water eq true }">Yes</c:if>
									<c:if test="${roomInfo.water eq false }">No</c:if>
								</p>
								<hr>
								
								<label for="rooms">Rooms</label>
								<p>${roomInfo.rooms }</p>
								<hr>
				
				</div>
				</div>

				<div class="card">
					<div class="card-header bg-info text-white">
						<h4>
							<i class="fas fa-user-plus"></i> Fill up your details
						</h4>
					</div>
					<div class="card-body">

						<form role="form"
							action="${pageContext.request.contextPath}/user/book/confirm"
							method="post">
							<!-- <input type="hidden" name="{_csrf.parameterName}"
								value="$_csrf.token}" /> -->
						<input name="rid" value="${roomInfo.id }" hidden="true">
 							
							<div class="form-group">
								<label for="rooms">Profession</label>
								<input type="text" id="profession" name="profession" class="form-control">
							</div>
							
							<div class="form-group">
								<label for="rooms">No. of Occupant</label>
								<input type="text" id="occupancy" name="occupancy" class="form-control">
							</div>

							<div class="form-group">
								<label for="remark">Drop your remark here!</label>
								<textarea id="remark" name="remark" class="form-control"
								 rows="5" cols="70"
								  placeholder="Enter any sepcial request or remark here"></textarea>
							</div>


							<div class="form-group">
								<label for="check_critiria">I Confirm The Booking!</label>

								<div class="input-group">
									<!-- Terms and conditions -->
									<span class="input-group-addon"> <a href="">Terms
											and conditions of Using this service</a>
									</span> 
									<!-- I accept check box -->
									<span class="input-group-addon"> <input type="checkbox">
									</span>
									
									<input id="check_critiria" name="check_critiria"
										class="form-control" type="text"
										placeholder="I accept the terms and Conditions" readonly>
								</div>

							</div>



							<div>
								<input type="submit" value="Confirm The Booking!"
									class="btn btn-primary" />
							</div>


						</form>


					</div>
				</div>

			</div>
		</div>

	</div>
</section>

<!-- Icons Grid -->
<section class="features-icons bg-light text-center">
	<div class="container">
		<div class="row">

			<c:forEach items="${rooms }" var="room">
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-screen-desktop m-auto text-primary"></i>
						</div>
						<h3>${room.type }</h3>
						<p class="lead mb-0">${room.description }</p>
						<p class="lead mb-0">
							<a
								href="${pageContext.request.contextPath }/user/room/detail/${room.id }">Book
								Now</a>
						</p>

					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</section>

<!-- Testimonials -->

<!-- Call to Action -->

<jsp:include page="footer.jsp" />

</html>