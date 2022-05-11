<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
    
    
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>Welcome property owner</h3>
            <p class="lead mb-0">${userinfo.firstName}&nbsp;${userinfo.lastName}</p>
            <p class="lead mb-0">
            <a href="${pageContext.request.contextPath }/owner/room/add">Add Room</a>
            </p>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary"></i>
            </div>
            <h3>Rooms</h3>
            <p class="lead mb-0"><a href="#own"> ${total_rooms } Rooms </a></p>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3>Bookings</h3>
            <p class="lead mb-0"><a href="#booked"> ${total_bookings } Bookings </a></p>
          </div>
        </div>
        
        <div class="col-lg-3">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3>Confirmed</h3>
            <p class="lead mb-0"><a href="#conform_booked"> ${total_confirmed_bookings } Confirmed </a></p>
          </div>
        </div>
        
      </div>
    </div>
  </section>

  <!-- Image Showcases -->
  <section id="own" class="showcase">
    <div class="container-fluid p-0">
    <h2 class="mb-5">Property you own...</h2>
     
    <c:forEach items="${rooms}" var="room">
      <div class="row no-gutters">
		<%--  <div class="col-lg-6 order-lg-2 text-white showcase-img" 
		 style="background-image: url('${pageContext.request.contextPath}/images/${room.images }');">
		 
		 </div> --%>
		 
		 <div class="col-lg-4 order-lg-2 text-white showcase-img">
          <!-- Home Main Image -->
          <c:set var="room_images" value="${fn:split(room.images, '; ')}" />  
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
		 
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>${room.area} sq-ft.</h2>
          <p class="lead mb-0">${room.description}</p>
          <p class="lead mb-0">${room.price} Rs</p>
          <p class="lead mb-0">${room.type}</p>
          <p class="lead mb-0">${room.addedOn}</p>
          <p class="lead mb-0">
          <c:if test="${room.status eq 1 }">Available</c:if>
          <c:if test="${room.status eq 0 }">Unavailable</c:if>
          </p>
          <p class="lead mb-0">
          <c:if test="${room.verify eq 1 }">Verified</c:if>
          <c:if test="${room.verify eq 0 }">Not Verified</c:if>
          </p>
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/owner/room/booking/${room.id}">See bookings</a>
          </p>
          <table>
          <tr>
          <td> <button type="button" class="btn btn-primary">Edit Room Details</button></td>
          <td>
          <a href="${pageContext.request.contextPath}/owner/room/delete/${room.id}">
<button type="button" class="btn btn-danger">	Delete Room</button></a></td>
          </tr>
          </table>
        </div>
      </div>
      </c:forEach>
      
    </div>
  </section>

  <!-- Testimonials -->
  <section id="booked" class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">Your booked property...</h2>
     <div class="row">
     <c:forEach items="${bookings}" var="book">
     
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            
            <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(book.room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0}">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          
            <h5>${book.room.type } </h5>
            <p class="font-weight-light mb-0">${book.user.username }</p>
            <p class="font-weight-light mb-0">${book.bookedOn }</p>
            <p class="font-weight-light mb-0">${book.profession }</p>
            <p class="font-weight-light mb-0">${book.occupancy }</p>
            <p class="font-weight-light mb-0">
            <a href="${pageContext.request.contextPath}/owner/booking/detail/${book.id }">View Detail</a>
            </p>
         </div>
       </div>
     </c:forEach>
       
        
        
      </div>
    </div>
  </section>


 <!-- Testimonials -->
  <section id="conform_booked" class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">Your conformed these bookings</h2>
     <div class="row">
     <c:forEach items="${confirmed_bookings}" var="book">
     
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            
		  <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(book.room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0}">
           <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          
            <h5>${book.room.type } </h5>
            <p class="font-weight-light mb-0">${book.user.username }</p>
            <p class="font-weight-light mb-0">${book.bookedOn }</p>
            <p class="font-weight-light mb-0">${book.profession }</p>
            <p class="font-weight-light mb-0">${book.occupancy }</p>
            <p class="font-weight-light mb-0">
            <a href="${pageContext.request.contextPath}/owner/booking/detail/${book.id }">View Detail</a>
            </p>
         </div>
       </div>
     </c:forEach>
       
        
        
      </div>
    </div>
  </section>


  <!-- Call to Action -->
  

	<jsp:include page="footer.jsp"/>

</html>