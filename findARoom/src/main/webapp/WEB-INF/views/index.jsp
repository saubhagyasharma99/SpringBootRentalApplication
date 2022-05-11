<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
  <!-- Icons Grid -->
  
  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
    <security:authorize access="!isAuthenticated()">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-2">Are you a registered member? 
          <a href="${pageContext.request.contextPath }/signup">Sign Up</a>
          <br>
          If you have an account  
           <a href="${pageContext.request.contextPath }/login">Log IN</a>
          </h1>
        </div>
      </div>
      </security:authorize>
      
       
      
    </div>
  </header>
  
  
 <%--  <!-- Listings -->
  <section id="listings" class="py-5">
    <div class="container">
      <h3 class="text-center mb-3">Search Room</h3>
      <div class="row">
        <!-- Listing 1 -->
        <c:forEach items="${roomlist }" var="room">
        <c:set var="rooms" value="${fn:split(room.images, ', ')}" />
        <div class="col-md-6 col-lg-4 mb-4">
          <div class="card listing-preview">
            <img class="card-img-top" src=" /images/${rooms[0]}" alt="">
            <div class="card-img-overlay">
              <h2>
                <span class="badge badge-secondary text-white">Rs${room.price }</span>
              </h2>
            </div>
            <div class="card-body">
              <div class="listing-heading text-center">
                
                <p>
                  <i class="fas fa-map-marker text-secondary"></i> ${room.location }</p>
              </div>
              <hr>
              <div class="row py-2 text-secondary">
                <div class="col-6">
                  <i class="fas fa-home"></i>Type: ${room.type }</div>
                <div class="col-6">
                  <i class="fas fa-parking"></i>Parking:${room.parking }</div>
              </div>
              <div class="row py-2 text-secondary">
                <div class="col-6">
                  <i class="fas fa-bed"></i>Bedroom: ${room.rooms }</div>
              <hr>
              <div class="row py-2 text-secondary">
                <div class="col-6">
                  <i class="fas fa-user"></i> ${room.user.username}</div>
              </div>
              <div class="row text-secondary pb-2">
                <div class="col-6">
                  <i class="fas fa-clock"></i> 5 days ago</div>
              </div>
              <hr>
              <a href="${pageContext.request.contextPath}/roomDetail/${room.id}" class="btn btn-primary">More Info</a>
              <a href="${pageContext.request.contextPath}/user/booking/${room.id}" class ="btn btn-primary">Booking</a>
            </div>
          </div>
        </div>
</c:forEach>
     
      </div>
    </div>
  </section>
  
   --%>
  
  <section class="features-icons bg-light text-center">
    <div class="container">
    
      <h2 class="mb-5">Featured rooms..</h2>
    
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>Search</h3>
            <p class="lead mb-0">Search for a place you like</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary"></i>
            </div>
            <h3>Book</h3>
            <p class="lead mb-0">Book a place you like</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3>Connect</h3>
            <p class="lead mb-0">Connect with people who would like to rent your property</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
    
    <c:forEach items="${roomlist }" var="room">
    
      <div class="row no-gutters">

        <div class="col-lg-4 order-lg-2 text-white showcase-img" >
        
          <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0}">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          
        </div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>${room.type }</h2>
          <p class="lead mb-0">${room.description }</p>
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/user/room/detail/${room.id }">View Detail</a>
          </p>
        </div>
      </div>
      
      </c:forEach>
      
      
    </div>
  </section>
  
  
  

  <!-- Testimonials -->
  

  <!-- Call to Action -->
  

	<jsp:include page="footer.jsp"/>

</html>