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
    
     <h3 class="text-center mb-3">Search Room</h3>
      <div class="row">
        <!-- Listing 1 -->
        <c:forEach items="${roomlist }" var="room">
        <c:set var="rooms" value="${fn:split(room.images, ';')}" />
        <div class="col-md-6 col-lg-4 mb-4">
          <div class="card listing-preview">
            <img class="card-img-top" src="${pageContext.request.contextPath}/images/${rooms[0]}" alt="">
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
                </div>
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
              </div>
          </div>
          <a href="${pageContext.request.contextPath}/user/room/detail/${room.id}" class="btn btn-primary">More Info</a>
            
        </div>
</c:forEach>
     
      </div>
    
    </div>
  </header>
  
  
   <!-- Showcase -->
  <section id="search">
    <div class="container text-center">
      <div class="home-search p-5">
        <div class="overlay p-5">
          <h1 class="display-4 mb-4">
            Room Searching Just Got So Easy
          </h1>
                 <a href="${pageContext.request.contextPath }/user/room/view"><h2>See Suggestions</h2></a>
          <p class="lead">Fill the form and search the room as your choice.</p>
          <div class="search">
            <form action="${pageContext.request.contextPath}/search" method="post">
              <!-- Form Row 1 -->
              <div class="form-row">
                <div class="col-md-6 mb-3">
                <div class="form-group">
                  <label class="sr-only">Room Type</label>
                  <input type="text" name="type" class="form-control" placeholder="Keyword (Single Room, Double Room, Flat, etc)">
                </div>
                </div>
				</div>
				<div class="form-row">
                <div class="col-md-6 mb-3">
                <div class="form-group">
                  <label class="sr-only">Location</label>
                  <input type="text" name="location" class="form-control" placeholder="Location">
                </div>
                </div>
				</div>  
              <div class="form-row">
                <div class="col-md-6 mb-3">
                <div class="form-group">
                <label class="sr-only">Price</label>
                  <select name="price" class="form-control" id="type">
                    <option selected="selected" value="0-0">None</option>
                    <option value="0-5000">Rs 0-5,000</option>
                    <option value="5000-10000">Rs5,000-10,000</option>
                    <option value="10000-15000">Rs10,000-15,000</option>
                    <option value="15000-20000">Rs15,000-20,000</option>
                    <option value="20000-25000">Rs20,000-25,000</option>
                    <option value="20000-25000">Rs25,000 above</option>
                  </select>
                </div>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md-6 mb-3">
              <button class="btn btn-secondary btn-block mt-4" type="submit">Submit form</button>
            </div>
            </div>
       
            </form>
          </div>
 
        </div>
      </div>
    </div>
  </section>
  
  
  
  

 
	<jsp:include page="footer.jsp"/>

</html>