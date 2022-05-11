<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />
<!-- Icons Grid -->
<!-- Image Showcases -->

<section id="register" class="bg-light py-5">
<div class="overlay"></div>
    
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div class="card">
					<div class="card-header bg-primary text-white">
						<h4>
							<i class="fas fa-user-plus"></i> 
							Thanks for Booking a Room.
							<br/>
							${msg }
							
						</h4>
					</div>
					<div class="card-body">
	<h4>
	You will be notified when owner reviews the message!
	</h4>
					</div>
		</div>
		</div>
		</div>
		</div>
		</section>

<!-- Icons Grid -->
<section class="features-icons bg-light text-center">
	<div class="container">
	<h2 class="mb-5">you also booked...</h2>
		<div class="row">
		

			<c:forEach items="${booking }" var="book">
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-screen-desktop m-auto text-primary"></i>
						</div>
						<h3>${book.room.type }</h3>
						<p class="lead mb-0">${book.room.description }</p>
						<p class="lead mb-0">${book.bookedOn }</p>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</section>





<jsp:include page="footer.jsp" />

</html>