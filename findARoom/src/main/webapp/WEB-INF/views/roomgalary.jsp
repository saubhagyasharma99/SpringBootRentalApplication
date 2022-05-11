<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
  
  <!-- our recommendations -->
  <c:if test="${roomsSuggested.size() > 0}">


  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">Our recommendation ...</h2>
      <div class="row">
      
      <c:forEach items="${roomsSuggested }" var="room">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
          
            <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0 }">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          
          <h5>${room.type }</h5>
            <p class="font-weight-light mb-0">${room.description }</p>
            <p class="font-weight-light mb-0">
            <a href="${pageContext.request.contextPath }/user/room/detail/${room.id }">View detail</a>
            </p>
          </div>
        </div>
        </c:forEach>
        
       </div>
    </div>
  </section>
</c:if>

  <!-- Latest -->
  <c:if test="${roomsLatest.size() > 0}">
  
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">Latest in market...</h2>
      <div class="row">
      
      <c:forEach items="${roomsLatest }" var="room">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0}">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          <h5>${room.type }</h5>
            <p class="font-weight-light mb-0">${room.description }</p>
            <p class="font-weight-light mb-0">
            <a href="${pageContext.request.contextPath }/user/room/detail/${room.id }">View detail</a>
            </p>
          </div>
        </div>
        </c:forEach>
        
       </div>
    </div>
  </section>
  </c:if>

<!-- Featured  -->
<c:if test="${roomsFeatured.size() > 0}">

<section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">Featured rooms...</h2>
      <div class="row">
      
      <c:forEach items="${roomsFeatured }" var="room">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
          
              <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0 }">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          
          <h5>${room.type }</h5>
            <p class="font-weight-light mb-0">${room.description }</p>
            <p class="font-weight-light mb-0">
            <a href="${pageContext.request.contextPath }/user/room/detail/${room.id }">View detail</a>
            </p>
          </div>
        </div>
        </c:forEach>
        
       </div>
    </div>
  </section>
  </c:if>
  
  <!-- Top  -->
  <c:if test="${roomsTop.size() > 0}">
<section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">Top rooms</h2>
      <div class="row">
      
      <c:forEach items="${roomsTop }" var="room">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
          
              <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(room.images, '; ')}" />  
           <c:if test="${fn:length(room_images) gt 0}">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
          
          <h5>${room.type }</h5>
            <p class="font-weight-light mb-0">${room.description }</p>
            <p class="font-weight-light mb-0">
            <a href="${pageContext.request.contextPath }/user/room/detail/${room.id }">View detail</a>
            </p>
          </div>
        </div>
        </c:forEach>
        
       </div>
    </div>
  </section>
</c:if>
  <!-- Call to Action -->


	<jsp:include page="footer.jsp"/>

</html>