<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cp" value="${pageContext.request.contextPath}"/>

    <!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>RoomFinder - Bookings</title>

  <!-- Custom fonts for this template-->
  <link href="${cp }/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${cp }/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
       <jsp:include page="navbar.jsp"></jsp:include>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Booking Management</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>

         
          <!-- Content Row -->

          <div class="row">
          
          <div class="col-lg-6">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Room Map</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                
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
                </div>
                </div>

           
            <div class="col-lg-6">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Displaying Room Detail</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <table>
                  <tbody>
                  <tr><td>Type</td><td>${room.type}</td></tr>
                  <tr><td>Area</td><td>${room.area}</td></tr>
                  <tr><td>Description</td><td>${room.description}</td></tr>
                  <tr><td>Status</td><td>${room.status}</td></tr>
                  <tr><td>Verified</td><td>${room.verify}</td></tr>
                  <tr><td>Price</td><td>${room.price}</td></tr>
                  <tr><td>Rooms</td><td>${room.rooms}</td></tr>
                  <tr><td>Added On</td><td>${room.addedOn}</td></tr>
                  <tr><td>Water</td><td>${room.water}</td></tr>
                  <tr><td>Parking</td><td>${room.parking}</td></tr>
                  </tbody>
                  </table>
                </div>
              </div>
            </div>

         
          </div>

          <!-- Content Row -->
          

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
         <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Enable or disable room</h6>
                </div>
                <div class="card-body">
                <p>
                <c:if test="${room.status eq 1}">
                <a href="${cp }/admin/room/disable/${room.id}">Make Unavailable</a>
                </c:if>
                <c:if test="${room.status eq 0}">
                <a href="${cp }/admin/room/enable/${room.id}">Make Available</a>
                </c:if>
                </p>
                
                <p>
                <c:if test="${room.verify eq 0}">
                <a href="${cp }/admin/room/doverify/${room.id}">Verify Room</a>
                </c:if>
                <c:if test="${room.verify eq 1}">
                <a href="${cp }/admin/room/unverify/${room.id}">UnVerify Room</a>
                </c:if>
                </p>
                </div>
              </div>

            

            </div>

           
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${cp }/admin/vendor/jquery/jquery.min.js"></script>
  <script src="${cp }/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${cp }/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${cp }/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${cp }/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${cp }/admin/js/demo/chart-area-demo.js"></script>
  <script src="${cp }/admin/js/demo/chart-pie-demo.js"></script>

</body>

</html>
    