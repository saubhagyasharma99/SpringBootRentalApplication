<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
  <!-- Icons Grid -->
  

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-6 order-lg-2 text-white showcase-img">
        <div class="mapouter">
        <div class="gmap_canvas">
        <iframe width="600" height="500" id="gmap_canvas" 
        src="https://maps.google.com/maps?q=${room.address.city }&t=&z=13&long=${room.address.longitude}&lat=${room.address.latitude}&ie=UTF8&iwloc=&output=embed" 
        frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
        </div>
        <style>
        .mapouter{position:relative;text-align:right;height:500px;width:600px;}
        .gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}
        </style>
        </div>
        </div>
        
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>Room Detail</h2>
          <p class="lead mb-0"></p>
        </div>
      </div>
     
      
    </div>
  </section>
  
<!--   featured rooms  -->


	<jsp:include page="footer.jsp"/>

</html>