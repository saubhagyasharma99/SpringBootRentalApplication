<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
 
  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      
      <div class="row no-gutters">
        <div class="col-lg-4 text-white showcase-img" >
        
          <!-- Home Main Image -->
          <c:set var="room_images" value="${fn:split(booking.room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0}">
          
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          <!-- Thumbnails -->
          <div class="row mb-5 thumbs">
            
            
            <c:forEach items="${room_images }" var="ri">
            <div class="col-md-2">
              <a href="<c:url value="/images/${ri}"/>" data-lightbox="home-images">
                <img src="<c:url value="/images/${ri}"/>" alt="" class="img-fluid">
              </a>
            </div>
            
           </c:forEach>
             
            </div>
            </c:if>
        
        </div>
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
		
		<form action="${pageContext.request.contextPath }/user/booking/pay/${booking.id}" method="post">
		<input type="hidden" name="grand_total" value="${booking.room.price }">
		<p class="lead mb-0">
		<input type="submit" value="Pay for booking"/>
		</p>
		</form>
		
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
    <h2>Your other bookings</h2>
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