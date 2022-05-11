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
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>Welcome User</h3>
            <p class="lead mb-0">${userinfo.firstName}</p>
            <p class="lead mb-0">${userinfo.lastName}</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary"></i>
            </div>
            <h3>Rooms</h3>
            <p class="lead mb-0">2</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3>Bookings</h3>
            <p class="lead mb-0">7</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
    <h2 class="mb-5">Property you booked...</h2>
     
    <c:forEach items="${booklist}" var="book">
      <div class="row no-gutters">
		 
		 <div class="col-lg-4 order-lg-2 text-white showcase-img" >
          <!--user Home Main Image -->
           <c:set var="room_images" value="${fn:split(book.room.images, '; ')}" />  
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
          <h2>${book.room.area} sq-ft.</h2>
          <p class="lead mb-0">${book.room.description}</p>
          <p class="lead mb-0">${book.room.price} Rs</p>
          <p class="lead mb-0">${book.room.type}</p>
          <p class="lead mb-0">${book.room.addedOn}</p>
          <p class="lead mb-0">${book.room.status}</p>
          <p class="lead mb-0">${book.bookedOn}</p>
          <p class="lead mb-0">${book.remark}</p>
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/user/booking/detail/${book.id}">View booking Detail</a>
          </p>
          
          <c:if test="${book.confirmed eq 0 }">
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/user/booking/cancel/${book.id}">Cancel this booking</a>
          </p>
          </c:if>
          
          <c:if test="${book.confirmed eq 1 }">
          <p class="lead mb-0">Your Booking has been confirmed!</p>
          <p class="lead mb-0">Cannot cancel this booking now!</p>
          </c:if>
          
        </div>
      </div>
      </c:forEach>
     
    </div>
  </section>

  

  <!-- Call to Action -->
 

	<jsp:include page="footer.jsp"/>

</html>