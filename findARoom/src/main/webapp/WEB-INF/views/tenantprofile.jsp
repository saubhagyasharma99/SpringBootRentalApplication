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
            <h3><a href="${pageContext.request.contextPath }/user/home">
            ${userinfo.firstName} &nbsp; ${userinfo.lastName}</a></h3>
            <p class="lead mb-0">${userinfo.username }
            </a>
            </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary"></i>
            </div>
            <h3><a href="${pageContext.request.contextPath }/user/home">
            Visits</a></h3>
            <p class="lead mb-0">7</p>
            </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
          <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3><a href="${pageContext.request.contextPath }/user/booking/view">
            Bookings</a></h3>
            <p class="lead mb-0">2</p>
           
            </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-4 order-lg-2 text-white showcase-img" >
          <!--user Home Main Image -->
           <c:set var="room_images" value="${fn:split(roomInfo1.images, '; ')}" />  
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
          <h2>Fully Residential Area</h2>
          <p class="lead mb-0">${roomInfo1.type }</p>
          <p class="lead mb-0">${roomInfo1.area }</p>
          <p class="lead mb-0">${roomInfo1.type }</p>
          <p class="lead mb-0">${roomInfo1.description }</p>
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/user/room/detail/${roomInfo1.id }">
          Book Now!
          </a>
          </p>
          <p class="lead mb-0">
		<a href="${pageContext.request.contextPath}/user/room/view">
          See More..
          </a>
		</p>
          
          </div>
      </div>
      <div class="row no-gutters">
        
 <div class="col-lg-4  text-white showcase-img" >
          <!-- Home Main Image -->
          <c:set var="room_images" value="${fn:split(roomInfo2.images, '; ')}" />  
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
          <h2>Prime Locations</h2>
			<p class="lead mb-0">${roomInfo2.type }</p>
          <p class="lead mb-0">${roomInfo2.area }</p>
          <p class="lead mb-0">${roomInfo2.rooms }</p>
          <p class="lead mb-0">${roomInfo2.description }</p>
          
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/user/room/detail/${roomInfo2.id }">
          Book Now!
          </a>
          </p>
          <p class="lead mb-0">
		<a href="${pageContext.request.contextPath}/user/room/view">
          See More..
          </a>
		</p>
</div>
      </div>
      <div class="row no-gutters">
        
 <div class="col-lg-4 order-lg-2 text-white showcase-img" >
          <!-- Home Main Image -->
          <c:set var="room_images" value="${fn:split(roomInfo3.images, '; ')}" />  
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
          <h2>Flexible &amp; Customizable</h2>
          <p class="lead mb-0">${roomInfo3.type }</p>
          <p class="lead mb-0">${roomInfo3.area }</p>
          <p class="lead mb-0">${roomInfo3.rooms }</p>
          <p class="lead mb-0">${roomInfo3.description }</p>
          
          <p class="lead mb-0">
          <a href="${pageContext.request.contextPath}/user/room/detail/${roomInfo3.id }">
          Book Now!
          </a>
          </p>
          <p class="lead mb-0">
		<a href="${pageContext.request.contextPath}/user/room/view">
          See More..
          </a>
		</p>
        </div>
      </div>
    </div>
  </section>

  
  
	<jsp:include page="footer.jsp"/>

</html>