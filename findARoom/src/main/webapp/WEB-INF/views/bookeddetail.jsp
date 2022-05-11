<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
 
  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" 
        style="background-image: url('${pageContext.request.contextPath}/images/${booking.room.images}');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h2>${booking.room.type }</h2>
          <p class="lead mb-0">${booking.room.description }</p>
          <p class="lead mb-0">${booking.room.rooms }</p>
		<p class="lead mb-0">${booking.room.area }</p>
		<p class="lead mb-0">${booking.room.price }</p>
		<p class="lead mb-0">${booking.bookedOn }</p>
		<p class="lead mb-0">${booking.profession }</p>
		<p class="lead mb-0">${booking.occupancy }</p>
		<p class="lead mb-0">${booking.remark }</p>
		<p class="lead mb-0"><a href="${pageContext.request.contextPath }/user/room/detail/${booking.room.id }">Room detail</a></p>
		<p class="lead mb-0">
		<a href="${pageContext.request.contextPath }/owner/booking/confirm/${booking.id}" > Confirm This Booking </a>
		</p>
		<c:if test="${booking_failed eq true}">
		<p class="lead mb-0">
		Room Booking Already Confirmed!
		</p>
		</c:if>
	</div>
	</div>
	
	<!-- add google map -->
	 <div class="row no-gutters">
        <div class="col-lg-9 text-white showcase-img">
        
        <div class="mapouter">
        <div class="gmap_canvas">
        <iframe width="600" height="500" id="gmap_canvas" 
        src="https://maps.google.com/maps?q=${booking.room.address.city }&t=&z=13&long=${booking.room.address.longitude}&lat=${booking.room.address.latitude}&ie=UTF8&iwloc=&output=embed" 
        frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
        </div>
        <style>
        .mapouter{position:relative;text-align:right;height:500px;width:600px;}
        .gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}
        </style>
        </div>
        
        </div>
    </div>
	
	</div>
  </section>
  
  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
    <h2>Your other booked rooms </h2>
      <div class="row">
      <c:forEach items="${booklist }" var="book">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>${book.room.type }</h3>
            <p class="lead mb-0">${book.room.description }</p>
            	<p class="lead mb-0"><a href="${pageContext.request.contextPath }/user/room/detail/${book.room.id }">View detail</a></p>
	
          </div>
        </div>
        </c:forEach>
        
      </div>  
    </div>
  </section>

 

  <!-- Testimonials -->
  

  <!-- Call to Action -->
  

	<jsp:include page="footer.jsp"/>

</html>