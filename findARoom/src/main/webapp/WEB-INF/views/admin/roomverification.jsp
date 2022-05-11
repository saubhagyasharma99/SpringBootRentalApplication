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

  <title>RoomFinder - Rooms Verify</title>

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
            <h1 class="h3 mb-0 text-gray-800">Rooms Management</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>

        
          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Verify New Rooms</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <table class="table table-responsive table-striped">
                  <thead>
                  <tr>
                  <th>Type</th>
                  <th>Area</th>
                  <th>Description</th>
                  <th>Status</th>
                  <th>Verify</th>
                  <th>Price</th>
                  <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${roomlist }" var="room">
                  <tr>
                  <td>${room.type }</td>
                  <td>${room.area }</td>
                  <td>${room.description }</td>
                  <td>${room.status }</td>
                  <td>${room.verify }</td>
                  <td>${room.price}</td>
                  <td>
                  <a href="${cp}/admin/room/verify/${room.id}">Verify Room</a>
                  </td>
                  </tr>
                  </c:forEach>
                  </tbody>
                  </table>
                </div>
              </div>
            </div>

         
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Update Room </h6>
                </div>
                <div class="card-body">
                
                <form class="form-responsive" action="${cp }/admin/room/verify" method="post">
                <input type="hidden" name="id" value="${newroom.id }">
                <div class="form-group">
                <ul>
                <li class="form-control">
                <label >Room Type: </label>&nbsp; ${newroom.type }
                </li>
                <li class="form-control">
                <label >Area: </label>&nbsp; ${newroom.area }
                </li>
                <li class="form-control">
                <label >Description: </label>&nbsp; ${newroom.description }
                </li>
                <li class="form-control">
                <label >Rooms: </label>&nbsp; ${newroom.rooms }
                </li>
                <li class="form-control">
                <label >Price: </label>&nbsp; ${newroom.price }
                </li>
                
                </ul>
                </div>
                
                
                
                <div class="form-group">
                <label for="verify">Verify the room so user is able to see and book </label>
                <select id="verify" class="form-control" name="verify">
                	<option value="1" <c:if test="${newroom.verify eq 1 }">selected</c:if>> Yes </option>
                	<option value="0" <c:if test="${newroom.verify eq 0 }">selected</c:if>> No </option>
                </select>
               
                </div>
                
                <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit"/>
                </div>
                
                </form>
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
    