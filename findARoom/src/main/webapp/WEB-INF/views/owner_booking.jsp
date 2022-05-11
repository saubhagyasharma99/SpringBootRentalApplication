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
            <h3>Welcome property owner</h3>
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
    <h2 class="mb-5">Bookings of Property you own...</h2>
     
    <c:forEach items="${bookings}" var="book">
      <div class="row no-gutters">
      
      <div class="col-lg-6 order-lg-2 text-white showcase-img" >
       <!-- accessing image from image array -->
          <c:set var="room_images" value="${fn:split(book.room.images, '; ')}" />  
           <c:if test="${room_images.size() gt 0 }">
          <img src="<c:url value="/images/${room_images[0]}"/>" alt="" class="img-main img-fluid mb-3">
          </c:if>
		 </div>
        <div class="col-lg-4 order-lg-1 my-auto showcase-text">
          <h2>${book.room.area} sq-ft.</h2>
          <p class="lead mb-0">${book.room.description}</p>
          <p class="lead mb-0">${book.room.price} Rs</p>
          <p class="lead mb-0">${book.room.type}</p>
          <p class="lead mb-0">${book.room.addedOn}</p>
          <p class="lead mb-0">${book.room.status}</p>
          <h2>Booked by:</h2>
          <table>
          <thead>
          <tr>
          <th>User_id</th>
          <th>Name</th>
          <th>Profession</th>
          <th>Occupancy</th>
          <th>Remark</th>
          </tr>
          </thead>
        
          <tr>
          <td>${book.user.id }</td>
          <td>${book.user.firstName } &nbsp; ${book.user.lastName }</td>
          <td>${book.profession }</td>
          <td>${book.occupancy }</td>
          <td>${book.remark }</td>
       
          </table>
        </div>
      </div>
      </c:forEach>
     
    </div>
  </section>



  
  

	<jsp:include page="footer.jsp"/>

</html>