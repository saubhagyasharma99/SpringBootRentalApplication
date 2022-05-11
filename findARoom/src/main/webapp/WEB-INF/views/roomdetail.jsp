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
        
<div class="col-lg-6 order-lg-2 text-white showcase-img" >
       <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(roomInfo.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0 }">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
		 </div>
		 
		 <div class="col-lg-4 my-auto showcase-text">
          <h2>${roomInfo.type }</h2>
          <p class="lead mb-0">${roomInfo.description }</p>
          <p class="lead mb-0">${roomInfo.rooms }</p>
		<p class="lead mb-0">${roomInfo.area }</p>
		<p class="lead mb-0">${roomInfo.price }</p>
		<p class="lead mb-0"><a href="${pageContext.request.contextPath }/user/book/room/${roomInfo.id }">Book Now</a></p>
	</div>
	</div>
	
	 <div class="row no-gutters">
        <div class="col-lg-9 text-white showcase-img">
        
        <div class="mapouter">
        <div class="gmap_canvas">
        <iframe width="600" height="500" id="gmap_canvas" 
        src="https://maps.google.com/maps?q=${roomInfo.address.city }&t=&z=17&long=${roomInfo.address.longitude}&lat=${roomInfo.address.latitude}&ie=UTF8&iwloc=&output=embed" 
        frameborder="2" scrolling="no" marginheight="2" marginwidth="2"></iframe>
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
    <h2>Featured Rooms</h2>
      <div class="row">
      <c:forEach items="${rooms }" var="room">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>${room.type }</h3>
            <p class="lead mb-0">${room.description }</p>
            	<p class="lead mb-0"><a href="${pageContext.request.contextPath }/user/room/detail/${room.id }">Book Now</a></p>
	
          </div>
        </div>
        </c:forEach>
        
      </div>  
    </div>
  </section>

 

  <!-- Testimonials -->
  

  
  </section>

	<jsp:include page="footer.jsp"/>

</html>